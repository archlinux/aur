pkgname='deepin-wine5-stable'
pkgver=5.0.0.15
pkgrel=1
pkgdesc="Deepin Wine5 stable"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
depends=(
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2'
        'lib32-ocl-icd' 'deepin-udis86' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig'
        'lib32-freetype2' 'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6'
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu'
    )
makedepends=('tar' 'p7zip')
source=(
    "https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.tencent.meeting.deepin/com.tencent.meeting.deepin_2.2.0.409deepin2_i386.deb"
)
sha256sums=('b71ba03418986a63808c78ef6af32a15deef84fe644c464ceb00266eea3e2945')

package() {
	cd ${srcdir}
	tar xpvf data.tar.xz --xattrs-include='*' --numeric-owner
	install -d ${pkgdir}/usr/lib/deepin-wine5-stable
    7z x -o${pkgdir}/usr/lib/deepin-wine5-stable opt/apps/com.tencent.meeting.deepin/files/wine_archive.7z
}
