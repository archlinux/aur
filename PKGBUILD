# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Contributor:  Ryan Peters < sloshy at sbcglobal dot net >
# Thanks to the Linux Mint project http://linuxmint.com/

pkgname='mint-x-icons'
pkgver='1.3.8'
pkgrel='1'
pkgdesc='Icon theme for Linux Mint. Based on mintified versions of Clearlooks Revamp, Elementary and Faenza.'
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
source=("${url}/${pkgname}_${pkgver}.tar.xz")
depends=('gdk-pixbuf2' 'gtk-update-icon-cache')
options=('!strip')
install="${pkgname}.install"
sha256sums=('4cf82a23399ca6f3987b5bd40fcb41797cd5f70f680e722b19b929746c3be798')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/usr" "${pkgdir}/"
}
