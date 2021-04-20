# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=2.3.2
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('SKIP')
makedepends=('git' 'nasm' 'mtools')
_dir="${pkgname}"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
