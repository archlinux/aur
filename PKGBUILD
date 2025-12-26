# Maintainer: PharmaRacist
pkgname=noon-nvidia
pkgver=2.0.0
pkgrel=1
pkgdesc="NVIDIA support for Noon"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'nvidia-utils'
    'lib32-nvidia-utils'
    'lib32-opencl-nvidia'
    'libva-nvidia-driver'
    'egl-wayland'
)
optdepends=(
    'nvidia-dkms: Proprietary NVIDIA drivers'
    'nvidia-open-dkms: Open-source NVIDIA drivers (AUR)'
)
conflicts=('noon-nvidia-legacy')
provides=('noon-nvidia-modern-support')
install=noon-nvidia.install
source=("setup_nvidia.sh::https://raw.githubusercontent.com/PharmaRacist/Noon/main/setup_data/setup_nvidia.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 setup_nvidia.sh "$pkgdir/usr/bin/noon-nvidia-setup"
}
