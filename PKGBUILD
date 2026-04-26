# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-finesssee-bin
pkgver=0.3.22
pkgrel=1
pkgdesc="A powerful CLI for Linear.app built with Rust (by Finesssee) - Binary"
arch=('x86_64' 'aarch64')
url="https://github.com/Finesssee/linear-cli"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("linear-cli-finesssee=${pkgver}")
conflicts=('linear-cli-finesssee')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/Finesssee/linear-cli/releases/download/v${pkgver}/linear-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/Finesssee/linear-cli/releases/download/v${pkgver}/linear-cli-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Finesssee/linear-cli/v${pkgver}/LICENSE")

sha256sums_x86_64=('c291becfd850ad85ccaa0e871d6723e019be8050c8647a92de916ee0a196c13c')
sha256sums_aarch64=('a1a569e70fd2b6a7b510c4e57d9297991157d37dd7d520ad605f35d1854c98e8')
sha256sums=('06dcddbb6908a0c6dd4a9e8ec822eea41d5a460a53089fecccc8a68049e99241')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
