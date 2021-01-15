# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=1.0.1
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("i686" "x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(${url}/archive/v1.0.1.tar.gz)
sha256sums=('f2b8bfe1feb4b3db3969339bd577c921f6b3c47d75be8232e168c3c711d0ba37')
_dir="${pkgname}-${pkgver}"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
