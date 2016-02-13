# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname="ImageMagick"
_srcver="6.9.3-4"
pkgname=imagemagick-full-doc
pkgver="$(echo ${_srcver} | tr '-' '.')"
pkgrel=2
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc')
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=('0d4266940d27afb617fc8b3481ffdf63dd02ca13806d581ac5cb28638725c275')

build() {
	cd "$_srcname"-"$_srcver"

        ./configure --prefix=/usr
}

package() {

	cd "$_srcname"-"$_srcver"
	
	make DESTDIR="$pkgdir/" install-data-html
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	
}
