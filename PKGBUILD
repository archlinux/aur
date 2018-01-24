# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=hashie
_pkgname=ruby-$_gemname
pkgver=3.4.6
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='Hashie is a collection of classes and mixins that make hashes more powerful.'
arch=(i686 x86_64)
url='https://github.com/intridea/hashie'
license=(MIT)
depends=(ruby)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('92ad8b7a3d4eaea3b7c858070a2f4d1a6e1e4dd3072c26bce85f439429f8c9db')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
