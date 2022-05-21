# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=515.43.04
pkgrel=1
pkgdesc="mhwd-nvidia pci id"
arch=("any")
url="https://garudalinux.org/"
license=('custom')
source=('mhwd-nvidia')
makedepends=('nvidia-dkms' 'nvidia-utils')
sha256sums=('738749f5ada14afac3085d10fac351c55d423674228eea1dae8e41b935d1497c')
provides=('mhwd-nvidia')
package() {

    install -d -m755 "$pkgdir/var/lib/mhwd/ids/pci/"

    # Generate mhwd database
    sh -e $srcdir/mhwd-nvidia \
    /usr/share/doc/nvidia/README \
    /usr/src/nvidia-$pkgver/nvidia/nv-kernel.o_binary \
    > $pkgdir/var/lib/mhwd/ids/pci/nvidia.ids

    install -Dm644 /usr/share/licenses/nvidia-dkms/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
