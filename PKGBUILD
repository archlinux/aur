# Maintainer: Frédéric Logier <fredix@nomad.wf>
pkgname=uncloud
_binaryname="uc"
pkgver=0.21.0
pkgrel=1
pkgdesc="A lightweight tool for deploying and managing containerised applications across a network of Docker hosts. Bridging the gap between Docker and Kubernetes ✨"
arch=('x86_64' 'aarch64')
url="https://github.com/psviderski/uncloud"
license=('Apache-2.0')
groups=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
source_x86_64=("${pkgname}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/uc_linux_amd64.tar.gz")
source_aarch64=("${pkgname}_linux_arm64_linux.tar.gz::${url}/releases/download/v${pkgver}/uc_linux_arm64.tar.gz")
sha256sums_x86_64=('11a87551d31144a5837c04d87d4f984c2a62b29052bb3a29d2a5cb72be7de616')
sha256sums_aarch64=('f9416a97a409865238e8a7be5ad4a0441cc8523c8f33967a9a87eea27109d47e')

validpgpkeys=()

package() {
    # Get architecture specific directory
    _archdir="$([[ $CARCH == "aarch64" ]] && echo "arm64" || echo "amd64")_linux"

    # Create package directory if it doesn't exist
    install -dm755 "${pkgdir}/usr/bin"

    # Extract archive to the package directory
    cp -a "${srcdir}/${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"
}
