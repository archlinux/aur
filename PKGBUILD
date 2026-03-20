# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=kconnect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.22
pkgrel=1
pkgdesc='CLI utility that can be used to discover and securely access Kubernetes clusters across multiple operating environments.'
arch=('x86_64' 'aarch64')
url="https://github.com/fidelity/kconnect"
depends=('kubectl')
license=('Apache-2.0')
optdepends=('aws-iam-authenticator: authentication to AWS EKS clusters'
            'azure-kubelogin: non-interactive authentication to Azure AKS clusters'
            'azure-cli: interactive authentication to Azure AKS clusters')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('2e3bb23f86867cfea35929c5a86fb46ac8a0c032312eb31cfb85b044ad5403aa')
sha256sums_aarch64=('0046af34a1693c2dc612bbd3eee99af370afb6160055ae2bd1847a0bfde770de')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
