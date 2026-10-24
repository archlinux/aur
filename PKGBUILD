# Maintainer: agony <27015 at riseup dot net>

pkgname=pgtui-bin
_pkgname=pgtui
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple terminal UI for PostgreSQL (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/pgplex/pgtui"
license=('MIT')
optdepends=('wl-clipboard: clipboard support on Wayland'
            'xclip: clipboard support on X11')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_release="${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}"
source_x86_64=("${_release}_linux_amd64.tar.gz")
source_aarch64=("${_release}_linux_arm64.tar.gz")
sha256sums_x86_64=('f5db95f13702dff30e6f0ea2af862463b1f3168daa022db3adf028eec910129f')
sha256sums_aarch64=('94cbd12b5871cb0d8163e9e8f56c57d07bc2720a049172d55935d12c40b0b88f')

package() {
  install -Dm755 pgtui -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
