# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=oauth
_pkgname=ruby-$_gemname
pkgver=0.5.4
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='OAuth Core Ruby implementation'
arch=(i686 x86_64)
url='http://www.rubydoc.info/gems/oauth/0.5.4'
license=(MIT)
depends=('ruby>=2.0.0')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('3e017ed1c107eb6fe42c977b78c8a8409249869032b343cf2f23ac80d16b5fff')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
