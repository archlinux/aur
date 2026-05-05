# Maintainer: ParticleG <particle_g at outlook dot com>
pkgname=gpu-hotswitch-vfio
pkgver=1.0.0
pkgrel=1
pkgdesc="Hot-switch discrete GPU between host and VFIO passthrough without reboot"
arch=('any')
url="https://github.com/ParticleG/gpu-hotswitch-vfio"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'kmod')
optdepends=(
    'qemu-desktop: KVM virtual machine manager'
    'libvirt: VM management daemon'
    'looking-glass: low-latency VM display client'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c138f45c36064993faea2d0aafd5cf82d9a77b372f915f2697c8e5fc40841026')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
