# Maintainer: Carl George < arch at cgtx dot us >
# Contributor:  Ryan Peters < sloshy at sbcglobal dot net >
# Special thanks to the Linux Mint project, without them this would not exist.

pkgname='mint-x-icons'
pkgver='1.3.3'
pkgrel='1'
pkgdesc='Mint-X Icon themes.  A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.gz")
depends=('gdk-pixbuf2' 'gtk-update-icon-cache')
options=('!strip')
install="${pkgname}.install"
sha256sums=('c0d16c6f89c5caa305cb4574dc4892f7d092bac364321a9992e3a6e21f30b5b9')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
