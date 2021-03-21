# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=2.0.1
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("i686" "x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(${url}/archive/refs/tags/v${pkgver}-binary.tar.gz)
sha256sums=('SKIP')
_dir="${pkgname}-${pkgver}-binary"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
