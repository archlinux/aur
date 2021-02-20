# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=1.0.6
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("i686" "x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('0cda59e63e7191bf66c2771046960e5fe0cba0a6b7b66c441fd9aee44065e7b4')
_dir="${pkgname}-${pkgver}"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
