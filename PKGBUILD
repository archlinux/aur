# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# thanks to the Linux Mint project http://linuxmint.com/

# Versioning of the package will not be the same as GTK2 or GTK3 versions, however, I'll keep
# it with the existing numbering to upgrade
pkgname='mint-x-theme'
_namegtk2='mint-themes'
_namegtk3='mint-themes-gtk3'
pkgver='1.5.1'
_gtk3ver='3.18+5'
_gtk2ver='1.4.6'
pkgrel='1'
pkgdesc='A Linux Mint theme.  Includes GTK2, GTK3, Metacity and Xfce components.'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
conflicts=('mint-themes')
source=("${url}/pool/main/m/${_namegtk2}/${_namegtk2}_${_gtk2ver}.tar.gz"
        "${url}/pool/main/m/${_namegtk3}/${_namegtk3}_${_gtk3ver}.tar.xz")
sha256sums=('49efc330923d4aef8d55ac589bca57882a9c52f69d8efa4c588863575b09e0d2'
            'bb7bb28da18cf841ab8d02ae3b6215cf742640bf35e47da5cf35b5109390c619')

prepare() {
	find ${srcdir} -name .gitkeep -type f -delete
	find ${srcdir} -type d ! -perm 755 -exec chmod 755 {} +
	find ${srcdir} -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership ${srcdir}/${_namegtk2}/usr ${pkgdir}/
	cp -dr --no-preserve=ownership ${srcdir}/${_namegtk3}/usr ${pkgdir}/
}
