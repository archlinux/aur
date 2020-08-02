# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reggae
pkgver=0.6.9
pkgrel=1
pkgdesc='Build system in D, Python, Ruby, Javascript or Lua'
arch=('x86_64')
url="https://github.com/atilaneves/reggae"
license=('BSD')
depends=('gcc-libs')
makedepends=('ninja' 'dmd' 'dub')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/atilaneves/reggae/archive/v${pkgver}.tar.gz")
sha256sums=('79cd77ff681ad97120b0be771a6cd1b84bb28e95cdda2131e06441516af6e919')

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