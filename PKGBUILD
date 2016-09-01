# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor:  Ryan Peters < sloshy at sbcglobal dot net >
# Thanks to the Linux Mint project http://linuxmint.com/

pkgname='mint-x-icons'
pkgver='1.3.9'
pkgrel='1'
pkgdesc='Icon theme for Linux Mint. Based on mintified versions of Clearlooks Revamp, Elementary and Faenza.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
depends=('gdk-pixbuf2' 'gtk-update-icon-cache')
options=('!strip')
install="${pkgname}.install"
sha256sums=('adbbbd81f14eb40b1df237ab3d9b4628add6e3f681f64c3982d3deb5257a0a83')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
