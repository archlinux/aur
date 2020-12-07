# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia-390xx
pkgver=390.138
pkgrel=1
pkgdesc="mhwd-nvidia-390xx pci id"
arch=("any")
url="https://garudalinux.org/"
license=('GPL2')
source=('mhwd-nvidia')
makedepends=('nvidia-390xx-dkms' 'nvidia-390xx-utils')
sha256sums=('11176f1c070bbdbfaa01a3743ec065fe71ff867b9f72f1dce0de0339b5873bb5')
provides=('mhwd-nvidia-390xx')
package() {

    install -d -m755 "$pkgdir/var/lib/mhwd/ids/pci/"

    # Generate mhwd database
    sh -e $srcdir/mhwd-nvidia \
    /usr/share/doc/nvidia/README \
    /usr/src/nvidia-$pkgver/nvidia/nv-kernel.o_binary \
    > $pkgdir/var/lib/mhwd/ids/pci/nvidia-390xx.ids
}
