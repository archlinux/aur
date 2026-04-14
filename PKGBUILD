# Maintainer: Frédéric Logier <fredix@nomad.wf>
_name=uncloud
pkgname=uncloud
_binaryname="uc"
pkgver=0.18.0
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
sha256sums_x86_64=('cde4288ba42748d5ff752d54324324c4b212fce29162f084da1bd2705fe4d44f')
sha256sums_aarch64=('c797b95a1a22ba092baab74e273fa2596c12e8169424228c47014038a8317abe')

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
