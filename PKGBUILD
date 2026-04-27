# Maintainer: Frédéric Logier <fredix@nomad.wf>
_name=uncloud
pkgname=uncloud
_binaryname="uc"
pkgver=0.19.0
pkgrel=1
pkgdesc="A lightweight tool for deploying and managing containerised applications across a network of Docker hosts. Bridging the gap between Docker and Kubernetes ✨"
arch=('x86_64' 'aarch64')
url="https://github.com/psviderski/uncloud"
license=('Apache-2.0')
groups=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_name}")
conflicts=("${_name}")
replaces=()
backup=()
source_x86_64=("${pkgname}_linux_amd64.tar.gz::${url}/releases/download/v${pkgver}/uncloud_linux_amd64.tar.gz")
source_aarch64=("${pkgname}_linux_arm64_linux.tar.gz::${url}/releases/download/v${pkgver}/uncloud_linux_arm64.tar.gz")
sha256sums_x86_64=('998af0e182e096a623c6e4518c64ed967dd8d05be6a0edfb3614fd8b655a2a96')
sha256sums_aarch64=('0f34464122b21d8d8e5e14b93ebf33757ef54a7fe1e825fc596f9aee76a0179d')

validpgpkeys=()

package() {
    # Get architecture specific directory
    _archdir="$([[ $CARCH == "aarch64" ]] && echo "arm64" || echo "amd64")_linux"

    # Create package directory if it doesn't exist
    install -dm755 "${pkgdir}/usr/bin"

    # Extract archive to the package directory
    cp -a "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    ln -sf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_binaryname}"
}
