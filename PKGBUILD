# Maintainer Valantin <valantin89 [at] gmail [dot] com>

_gemname=clamp
_pkgname=ruby-$_gemname
pkgver=1.1.2
pkgname=$_pkgname-$pkgver
pkgrel=1
pkgdesc='a minimal framework for command-line utilities'
arch=(any)
url='http://github.com/mdub/clamp'
license=(MIT)
depends=(ruby)
provides=("$_pkgname=$pkgver")
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=($_gemname-$pkgver.gem)
sha256sums=('f338133cf34d9a2b8d51d5b545f29c1455e5a3c631b62a4c19504ad50eb9a250')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" $_gemname-$pkgver.gem
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
