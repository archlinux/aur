# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor:  Ryan Peters < sloshy at sbcglobal dot net >
# Thanks to the Linux Mint project http://linuxmint.com/

pkgname='mint-x-icons'
pkgver=1.4.9
pkgrel=1
pkgdesc="Icon theme for Linux Mint"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
depends=('gdk-pixbuf2' 'gtk-update-icon-cache')
sha256sums=('ad4e6c524a2c3e3a5c3f7e7cddea206bf92aba024312fbad312ee47d1ef5b959')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
