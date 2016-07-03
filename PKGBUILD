# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# thanks to the Linux Mint project http://linuxmint.com/

# Versioning of the package will not be the same as GTK2 or GTK3 versions
pkgname='mint-x-theme'
_namegtk2='mint-themes'
_namegtk3='mint-themes-gtk3'
pkgver='1.7'
_gtk3ver='3.18+7'
_gtk2ver='1.4.7'
pkgrel='1'
pkgdesc='A Linux Mint theme.  Includes GTK2, GTK3, Metacity and Xfce components.'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
conflicts=('mint-themes')
source=("${url}/pool/main/m/${_namegtk2}/${_namegtk2}_${_gtk2ver}.tar.xz"
        "${url}/pool/main/m/${_namegtk3}/${_namegtk3}_${_gtk3ver}.tar.xz")
sha256sums=('924765b8fba708dbf053698002e65f6ea4c6b41880fa8bf423563b86f1400005'
            '026d0b82eda6582a1022350bee8b4aad1c79c5880f8be1accdae9b9c80f405a3')

prepare() {
	find ${srcdir} -name .gitkeep -type f -delete
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/${_namegtk2}/usr ${pkgdir}/
	cp -dr --no-preserve=ownership ${srcdir}/${_namegtk3}/usr ${pkgdir}/
}
