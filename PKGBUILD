# Maintainer: Ange Kevin Amlaman (charveey) <amlamanangekevin at gmail dot com>

pkgname=radeontop-gui
pkgbase=radeontop-gui
pkgver=1.1.5
pkgrel=2
pkgdesc="Utility to show Radeon GPU utilization"
url=https://github.com/erol-y/radeontop-gui
arch=("x86_64")
license=("GPL3")
depends=('glibc' 'gcc-libs' 'libdrm' 'wxgtk3')
source=(
    radeontop-gui_1.5.5-1ubuntu18.10.1_amd64.deb
    radeontop-gui
)

package() {
    # extract the data file (already has everything as we need it)
    tar -xf "${srcdir}/data.tar.xz"

    install -Dm755 "${srcdir}radeontop-gui" "${pkgdir}/usr/bin/radeontop-gui"
    install -Dm755 "${srcdir}/usr/sbin/radeontop-gui.v1" "${pkgdir}/usr/bin/radeontop-gui.v1"
    install -Dm755 "${srcdir}/usr/share/applications/radeontop-gui.desktop" "${pkgdir}/usr/share/applications/radeontop-gui.desktop"

}

md5sums=('2fe6799e3172b3dce86f1037623c4ba3'
         '50d03aaf94d292b983e4e667b4fcbda4')
