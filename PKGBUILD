# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=1.0.2
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("i686" "x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(${url}/archive/v1.0.2.tar.gz)
sha256sums=('25c7b386e5459d28f3c45d4b22eea16fd3db5743408a15baa984442fffeef026')
_dir="${pkgname}-${pkgver}"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
