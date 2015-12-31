# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# Change font directories bellow to match yours.
# DeJaVu and GhostScript font directories provided bellow are the default ones.
# Windows font directory provided bellow is set according to the example in Arch Linux Wiki.

_srcname="ImageMagick"
_srcver="6.9.2-10"
pkgname=imagemagick-full-doc
pkgver="$(echo ${_srcver} | tr '-' '_')"
pkgrel=2
pkgdesc="The ImageMagick documentation (utilities manuals and libraries API)"
arch=('any')
url="http://www.imagemagick.org/"
license=('custom')
provides=('imagemagick-doc')
conflicts=('imagemagick-doc' 'imagemagick-git-doc')
source=("http://www.imagemagick.org/download/${_srcname}-${_srcver}.tar.xz")
sha256sums=('da2f6fba43d69f20ddb11783f13f77782b0b57783dde9cda39c9e5e733c2013c')

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
