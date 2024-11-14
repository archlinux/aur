# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=kconnect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.18
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
sha256sums_x86_64=('7134782999af2dd070d190fbac09bd300a2af9229e4b766ae5cc02b429d49120')
sha256sums_aarch64=('d552fc5c4c521fdd8161d6fe7138980307f5c8219a2e40bda95f045cd6fa1d92')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
