# Maintainer: Carl George < arch at cgtx dot us >
# Contributor:  Ryan Peters < sloshy at sbcglobal dot net >
# Special thanks to the Linux Mint project, without them this would not exist.

pkgname='mint-x-icons'
pkgver='1.3.0'
pkgrel='1'
pkgdesc='Mint-X Icon themes.  A mint/metal theme based on mintified versions of Clearlooks Revamp, Elementary and Faenza.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.gz")
options=('!strip')
install="${pkgname}.install"
sha256sums=('9ba87eb03a88e0c7c1b05c83dadc94c45f39190af92867ec28d539cc6b33a43a')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
