# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname="ImageMagick"
_srcver="6.9.3-2"
pkgname=imagemagick-full-doc
pkgver="$(echo ${_srcver} | tr '-' '_')"
pkgrel=1
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc')
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=('78a9bfc581c81fb8376c00d06431b49f218d3900690905dc985459cbf5e41c4d')

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
