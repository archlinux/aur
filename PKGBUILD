# Maintainer: Librewish <librewish@gmail.com>
# Maintainer: TNE <tne at garudalinux org>
# Contributer : Guinux <nuxgui@gmail.com>

pkgname=mhwd-nvidia
pkgver=520.56.06
pkgrel=1
pkgdesc="mhwd-nvidia pci id"
arch=("any")
url="https://garudalinux.org/"
license=('custom')
source=('mhwd-nvidia')
makedepends=('nvidia-dkms' 'nvidia-utils')
sha256sums=('fc77d5f4bf9df15afb33c85cf957294a0e942aa23ee730d8fc45b2d8b2853950')
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
