# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=2.79.1
pkgrel=2
pkgdesc="An advanced x86/x86_64 BIOS/UEFI bootloader"
arch=("x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/limine-v${pkgver}.tar.xz)
sha256sums=('SKIP')
makedepends=('nasm' 'mtools')

build() {
  cd "$pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-v$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
