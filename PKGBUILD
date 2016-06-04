# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname="ImageMagick"
_srcver="7.0.1-6"
pkgname=imagemagick-full-doc
pkgver="$(echo ${_srcver} | tr '-' '.')"
pkgrel=2
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc' 'imagemagick-full-doc-git')
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=('18f5fa80ffd40be1b61946cdf58531df7fdf6d6e5551fd28a7dac83384e93f23')

build() {
	cd "$_srcname"-"$_srcver"
	
	./configure --prefix=/usr
}

package() {
	cd "$_srcname"-"$_srcver"
	
	make DESTDIR="$pkgdir/" install-data-html
	
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 NOTICE  "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
