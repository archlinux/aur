# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-finesssee-bin
pkgver=0.3.28
pkgrel=1
pkgdesc="A powerful CLI for Linear.app built with Rust (by nesszer) - Binary"
arch=('x86_64' 'aarch64')
url="https://github.com/nesszer/linear-cli"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc')
provides=("linear-cli-finesssee=${pkgver}")
conflicts=('linear-cli-finesssee')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nesszer/linear-cli/releases/download/v${pkgver}/linear-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nesszer/linear-cli/releases/download/v${pkgver}/linear-cli-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/nesszer/linear-cli/v${pkgver}/LICENSE")

sha256sums_x86_64=('5af0cac71903dd31f155553e4892280dbd4f0f347536095a963bfa1aeb7c26a3')
sha256sums_aarch64=('621e29d4be1a70f70bb3157265b43c7b4cec0ed1aa0499a6b6b348b37cbc78a0')
sha256sums=('06dcddbb6908a0c6dd4a9e8ec822eea41d5a460a53089fecccc8a68049e99241')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
