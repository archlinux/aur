# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname=pix-bin
_pkgname=pix
pkgver=1.0.6
pkgrel=1
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project."
arch=("x86_64" "i686")
license=("GPL")
depends=("desktop-file-utils" "gconf" "librsvg" "gst-plugins-base-libs" "gsettings-desktop-schemas" "libwebp" "webkit2gtk")
makedepends=("rpmextract")
optdepends=("gstreamer: Video support"
    "exiv2: Embedded metadata support"
    "libjpeg-turbo: Jpeg writing support"
    "libtiff: Tiff writing support"
    "libopenraw: Support for RAW photos"
    "brasero: Burn discs"
    "liboauth: Web albums")
provides=("pix")
conflicts=("pix" "pix-git")

source_x86_64=("http://download.opensuse.org/repositories/X11:/Cinnamon:/Factory/openSUSE_Factory/x86_64/${_pkgname}-${pkgver}-7.19.x86_64.rpm")
source_i686=("http://download.opensuse.org/repositories/X11:/Cinnamon:/Factory/openSUSE_Factory/i586/${_pkgname}-${pkgver}-7.19.i586.rpm")

md5sums_x86_64=("cfb575d62289ef1d624b8fd29cb3830b")
md5sums_i686=("812764b14b2dd1379de10e0c5d00e600")

noextract=("pix*")

package() {
	cd $pkgdir
	rpmextract.sh $srcdir/$_pkgname-$pkgver-*.rpm
	mv usr/lib64 usr/lib
	find $pkgdir/usr -type d -exec chmod 755 {} \;
}
