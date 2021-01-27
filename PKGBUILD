# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=limine
pkgver=1.0.3
pkgrel=1
pkgdesc="An advanced x86/x86_64 BIOS bootloader"
arch=("i686" "x86_64")
url="https://github.com/limine-bootloader/limine"
license=("BSD")
source=(${url}/archive/v1.0.3.tar.gz)
sha256sums=('20566c05743a0b2418e37db8bb02b0e94102b5e2414529ed708c56def500ee61')
_dir="${pkgname}-${pkgver}"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
