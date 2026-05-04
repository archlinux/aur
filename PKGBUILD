# Maintainer: Leandro Vital <leandro.vital@yahoo.com.br>

pkgname=next80
pkgver=1.0.0
pkgrel=1
pkgdesc="8080, Z80, R800, Z280 and eZ80 assembler/linker toolchain compatible with MACRO-80"
arch=('x86_64' 'aarch64')
url="https://github.com/lvitals/next80"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
source=("https://github.com/lvitals/next80/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
