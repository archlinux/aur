# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae
pkgname=fs-uae-devel
pkgver=2.7.12dev
pkgrel=1
pkgdesc="Cross-platform Amiga emulator based on UAE/WinUAE (development version)."
arch=("i686" "x86_64")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("sdl2" "libpng" "openal" "mesa" "glew" "libmpeg2" "gettext" "freetype2" "hicolor-icon-theme"
         "xdg-utils" "shared-mime-info")   # 'glib2' provided by 'gettext', 'zlib' by 'libpng', and libxi by glew
makedepends=('zip')
install="${pkgname}.install"
source=("http://fs-uae.net/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
#source=("http://ppa.launchpad.net/fengestad/devel/ubuntu/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
provides=("fs-uae")
conflicts=("fs-uae")
md5sums=('cc384ea107cfd058d36330c19c981e77')

#MAKEFLAGS="-j1"



build() {
   cd ${_pkgname}-${pkgver}

   ./configure --prefix=/usr
   make
}



package() {
   cd ${_pkgname}-${pkgver}

   make install DESTDIR="${pkgdir}"
}


# vim:set ts=3 sw=3 sts=3 et:

