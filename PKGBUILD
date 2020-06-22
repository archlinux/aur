# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>

pkgname=('vst-video-bin')
_pkgname='vst-video'
pkgver=2.55
pkgrel=1
pkgdesc="Creates a cloud playback platform for Linux."
arch=('x86_64')
url="https://github.com/xymov/vst-video"
license=('GPL3')
groups=('')
provides=(${_pkgname})
depends=('qt5-multimedia')
makedepends=('tar')
optdepends=()
source=("https://github.com/xymov/vst-video/releases/download/V${pkgver}/${_pkgname}.deb"
        "vst-video.desktop")
md5sums=('a12bc1fb1d82e0f2ad57ad2310f04176'
         '85395127ed4ce23f7dddfe437fcf9166')
install=

prepare() {
    #mkdir -p ${srcdir}/pkg/usr/bin
    tar xf ${srcdir}/data.tar.xz -C ${srcdir}
    #mv ${srcdir}/pkg/usr/src/vst-video ${srcdir}/pkg/usr/bin/
    #cp -f ${srcdir}/vst-video.desktop ${srcdir}/pkg/usr/share/applications/
}

package() {
    install -d ${pkgdir}/usr/lib/vst-video ${pkgdir}/usr/share/applications ${pkgdir}/usr/share/icons/vst-video
    install -m755 ${srcdir}/usr/src/vst-video/vst-video ${pkgdir}/usr/lib/vst-video
    install -m755 ${srcdir}/vst-video.desktop ${pkgdir}/usr/share/applications
    install -m644 ${srcdir}/usr/share/icons/vst-video/icon.svg ${pkgdir}/usr/share/icons/vst-video
}
