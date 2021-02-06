# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=1.0.4
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("i686" "x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('f5b9e1f9569c30ed8f87e4a2dfdafc0b4550775564d66b5055db7008758f54a3')
_dir="${pkgname}-${pkgver}"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
