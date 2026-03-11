# Maintainer: Frédéric Logier <fredix@nomad.wf>
_name=uncloud
pkgname=uncloud
_binaryname="uc"
pkgver=0.17.1
pkgrel=2
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
sha256sums_x86_64=('58c96235c4c199a873f22186a1b88cfd62ce7284aeadd5af14ba754c12079f29')
sha256sums_aarch64=('391c4ff910aa1b811f97a55f62db918a84689863c570d85952d44d9847818f6c')

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
