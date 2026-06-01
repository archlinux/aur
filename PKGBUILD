# Maintainer: JP Roemer <jp+aur@roemer.im>

pkgname=kconnect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.23
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
sha256sums_x86_64=('b39c4773b431aed1dc0577f8a37a1c1eb19e345ab136b64fc691442b53a00155')
sha256sums_aarch64=('739fbc09ed9ecfef6f518b8f5e9c10d33ca3012a1af8cd38a8d4a75f7ffa6ab2')

package() {
    install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
