# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia-390xx
pkgver=390.143
pkgrel=1
pkgdesc="mhwd-nvidia-390xx PCI ID database"
arch=("any")
url="https://garudalinux.org/"
license=('GPL2')
makedepends=('nvidia-390xx-dkms')
source=('mhwd-nvidia')
b2sums=('8141f8b95c403788092c83f067538170734b2a8c6e1f0e5df11677dc15693558f99278680b7d89f8eab0b8cd19b21476b438bcecf303074946d07ad3e43703c8')

package() {
    install -d "$pkgdir"/var/lib/mhwd/ids/pci/

    # Generate mhwd database
    sh -e "$srcdir"/mhwd-nvidia \
        /usr/share/doc/nvidia/README \
        /usr/src/nvidia-$pkgver/nvidia/nv-kernel.o_binary \
        > "$pkgdir"/var/lib/mhwd/ids/pci/nvidia-390xx.ids
}
