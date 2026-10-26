# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=kconnect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.26
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
sha256sums_x86_64=('7ac322cd5a5af04e2d72c0e81742757c5d1ef8de36526f8a11ae5f03792da46c')
sha256sums_aarch64=('48c549ce20f93a219746e81f06a95767f43bb72e0c82458f038b7cceef249a81')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
