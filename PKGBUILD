# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reggae
pkgver=0.6.8
pkgrel=1
pkgdesc='Build system in D, Python, Ruby, Javascript or Lua'
arch=('x86_64')
url="https://github.com/atilaneves/reggae"
license=('BSD')
depends=('gcc-libs')
makedepends=('ninja' 'dmd' 'dub')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atilaneves/reggae/archive/v${pkgver}.tar.gz")
sha256sums=('001847383ac27997830efaf61d388d8fe6d211a5e86d9e71a4284005c22518e7')

build() {
  cd "${pkgname}-${pkgver}"
  dub add unit-threaded
  ./bootstrap.sh ninja
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 bin/reggae -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et: