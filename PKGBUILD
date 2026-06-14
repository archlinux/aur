# Maintainer: ParticleG <particle_g at outlook dot com>
pkgname=gpu-hotswitch-vfio
pkgver=1.1.4
pkgrel=1
pkgdesc="Hot-switch discrete GPU between host and VFIO passthrough without reboot"
arch=('any')
url="https://github.com/ParticleG/gpu-hotswitch-vfio"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'kmod' 'psmisc')
optdepends=(
    'qemu-desktop: KVM virtual machine manager'
    'libvirt: VM management daemon'
    'looking-glass: low-latency VM display client'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
