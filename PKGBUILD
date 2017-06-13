# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >
# Thanks to the Linux Mint project http://linuxmint.com/

# Versioning of the package will not be the same as GTK2 or GTK3 versions
# pkgver will increase only on major GTK3 releases since GTK2 is barely maintained
# pkgrel will increase on minor GTK3 releases, newer GTK2 releases (be it major or minor) or adding/deleting comments
pkgname='mint-x-theme'
_namegtk2='mint-themes'
_namegtk3='mint-themes-gtk3'
pkgver=1.9
_gtk3ver=3.18+17
_gtk2ver=1.5.0
pkgrel=3
pkgdesc='A Linux Mint theme.  Includes GTK2, GTK3, Metacity and Xfce components.'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
conflicts=('mint-themes')
source=("${url}/pool/main/m/${_namegtk2}/${_namegtk2}_${_gtk2ver}.tar.xz"
        "${url}/pool/main/m/${_namegtk3}/${_namegtk3}_${_gtk3ver}.tar.xz")
sha256sums=('0357e4ecd3cfb43d9201f35d42498fd39f40b40e6d434afc99c3037fe8e448d0'
            'f5718cd9ca6fcb0ca46ac39a8f21978a7932bed53fb229273d23be67dffd5aee')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
	cp -dr --no-preserve=ownership "${srcdir}/${_namegtk2}/usr" "${pkgdir}/"
	cp -dr --no-preserve=ownership "${srcdir}/${_namegtk3}/usr" "${pkgdir}/"
}
