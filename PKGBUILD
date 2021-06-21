# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=deepin.com.dingtalk.com
pkgver=6.0.0.11902
deepin=1
pkgrel=1
epoch=
pkgdesc="Deepin Wine dingtalk"
arch=('i686' 'x86_64')
url="https://www.dingtalk.com/"
license=('Proprietary')
groups=()
depends=(
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2'
        'lib32-ocl-icd' 'deepin-udis86' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig'
        'lib32-freetype2' 'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6'
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu'
    )
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.INSTALL
changelog=
source=("https://github.com/zhullyb/deepin.com.dingtalk.com/releases/download/v${pkgver}/${pkgname}_${pkgver}deepin${deepin}_i386.deb"
        "git+https://github.com/zhullyb/deepin.com.dingtalk.com.git")
noextract=("${pkgname}_${pkgver}deepin${deepin}_i386.deb")
md5sums=('58aecd26cb5996de91a36dd5c5161127'
         'SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}deepin${deepin}_i386.deb
	mkdir ${pkgname}_${pkgver}deepin${deepin}
	tar -xf data.tar.xz --directory="${pkgname}_${pkgver}deepin${deepin}"
}

package() {
	cd "${pkgname}_${pkgver}deepin${deepin}"
	cp -r ./ ${pkgdir}/

	mkdir -p ${pkgdir}/usr/share/
	mv ${srcdir}/deepin.com.dingtalk.com/icons/ ${pkgdir}/usr/share/
	mv ${srcdir}/deepin.com.dingtalk.com/applications/ ${pkgdir}/usr/share/
}
