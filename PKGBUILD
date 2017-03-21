# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Thanks to the Linux Mint project http://linuxmint.com/

# Versioning of the package will not be the same as GTK2 or GTK3 versions
# pkgver will increase only on major GTK3 releases since GTK2 is barely maintained
# pkgrel will increase on minor GTK3 releases, newer GTK2 releases (be it major or minor) or adding/deleting comments
pkgname='mint-x-theme'
_namegtk2='mint-themes'
_namegtk3='mint-themes-gtk3'
pkgver='1.9'
_gtk3ver='3.18+13'
_gtk2ver='1.4.8'
pkgrel='1'
pkgdesc='A Linux Mint theme.  Includes GTK2, GTK3, Metacity and Xfce components.'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
conflicts=('mint-themes')
source=("${url}/pool/main/m/${_namegtk2}/${_namegtk2}_${_gtk2ver}.tar.xz"
        "${url}/pool/main/m/${_namegtk3}/${_namegtk3}_${_gtk3ver}.tar.xz")
sha256sums=('55e338403dfba0cfd44ded2ffbece925f9c5e02cedafc697eb577f302612d212'
            '248f470a864535daf0d8c132a39d30ee5a91f3e1f7f9afe423c9e7e0671d1e49')

prepare() {
	find ${srcdir} -name .gitkeep -type f -delete
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/${_namegtk2}/usr ${pkgdir}/
	cp -dr --no-preserve=ownership ${srcdir}/${_namegtk3}/usr ${pkgdir}/
}
