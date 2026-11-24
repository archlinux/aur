# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mousiki
pkgver=1.0
pkgrel=1
pkgdesc="Fast, customizable TUI music player"
arch=('x86_64' 'aarch64')
url="https://github.com/itzender5820/mousiki"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/V${pkgver}.tar.gz")
sha256sums=('fa7c40ac5b2eb5bab0d7ae6f0657843bafc56a3405b860bddfdb1fb885670bd5')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  install -Dm755 build/mousiki -t "${pkgdir}/usr/bin"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
