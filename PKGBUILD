# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=bcvk-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="bcvk - bootc virtualization kit"
arch=("x86_64")
url="https://github.com/bootc-dev/bcvk"
license=('Apache-2.0')
depends=(
    'glibc'
    'gcc-libs'
    'qemu-system-x86'
    'libvirt'
    'podman'
    'virtiofsd'
    'openssh'
)
source=("${url}/releases/download/v${pkgver}/bcvk-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('be1579364d8d9f2f592f0f443f41bf2ebdba59d116e1fe8cee097cd36721edba554e8fe40457c0b0f8f8534e748ed03f4f37091e9ded9daf4e71756b846633b9')

package() {
    # https://github.com/bootc-dev/bcvk/pull/163
    mkdir -p "${pkgdir}/usr/local/bin/"
    ln -s /usr/lib/virtiofsd "${pkgdir}/usr/local/bin/virtiofsd"
    install -vDm755 bcvk-x86_64-unknown-linux-gnu "${pkgdir}/usr/bin/bcvk"
}
