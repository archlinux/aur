# Maintainer: grimi <grimi at poczta dot fm>

_pkgname=fs-uae
pkgname=fs-uae-devel
pkgver=2.9.5dev
pkgrel=1
pkgdesc="Cross-platform Amiga emulator based on UAE/WinUAE (development version)."
arch=("i686" "x86_64")
url="http://fs-uae.net/download-devel"
license=("GPL2")
depends=("sdl2" "libpng" "openal" "mesa" "libxi" "libmpeg2" "gettext" "freetype2" "hicolor-icon-theme"
         "desktop-file-utils" "shared-mime-info") # 'glib2' provided by 'gettext', 'zlib' by 'libpng'
makedepends=('zip')
source=("http://fs-uae.net/devel/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
provides=("fs-uae")
conflicts=("fs-uae")
sha256sums=('dd7886d2400e83169641f690cc341e3e80594a56ba1683915a57a73dc02934a3')

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

