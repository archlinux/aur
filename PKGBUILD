# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=kconnect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.16
pkgrel=1
pkgdesc='CLI tool which enables you to login and retrieve AWS temporary credentials using a SAML IDP'
arch=('x86_64' 'aarch64')
url="https://github.com/fidelity/kconnect"
depends=('kubectl')
license=('Apache-2.0')
optdepends=('aws-iam-authenticator: authentication to AWS EKS clusters'
            'azure-kubelogin: non-interactive authentication to Azure AKS clusters'
            'azure-cli: interactive authentication to Azure AKS clusters')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('dd59c19c0f25c889bdf900018fc747aa1c9ca32dafef9c2fc19048f5c688a50b')
sha256sums_aarch64=('cc8c1a825a30894d62ae6a3d70f0290eab1bdd34bfc47ed113404c824e211535')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
