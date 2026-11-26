# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iam-policy-autopilot-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Static code analysis tool that generates baseline AWS IAM policies"
arch=('x86_64' 'aarch64')
url="https://github.com/awslabs/iam-policy-autopilot"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/awslabs/iam-policy-autopilot/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/iam-policy-autopilot-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/iam-policy-autopilot-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b')
sha256sums_x86_64=('737de8c943e3acbf7ae8ef43a655b4b613324a6839aaf1e3e2232859f3caa190')
sha256sums_aarch64=('036bd80f552e99469e70b8e614dc6d40df4c3f7e7b78465a6b2fc13d79be17fc')

package() {
  install -Dm755 "iam-policy-autopilot" "${pkgdir}/usr/bin/iam-policy-autopilot"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
