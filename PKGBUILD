# Maintainer: Carl George < arch at cgtx dot us >
# Contributor:  Ryan Peters < sloshy at sbcglobal dot net >
# Special thanks to the Linux Mint project, without them this would not exist.

pkgname='mint-x-icons'
pkgver='1.3.4'
pkgrel='1'
pkgdesc='Mint-X Icon themes.  A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
depends=('gdk-pixbuf2' 'gtk-update-icon-cache')
options=('!strip')
install="${pkgname}.install"
sha256sums=('cda6bda228d4b66149c5ecc44c9331a8b3c9ef3b98c4c092e76c59d33cb1cc9a')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
