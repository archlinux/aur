# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Brian Weasner <weasnerb at gmail dot com>
_projectname='MaterialDesign-Webfont'
pkgname='ttf-material-design-icons-webfont'
pkgver='7.4.47'
pkgrel='2'
pkgdesc='Material Design webfont icons from materialdesignicons.com'
arch=('any')
url='https://materialdesignicons.com'
license=('Apache-2.0')
checkdepends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Templarian/$_projectname/archive/v$pkgver.tar.gz")
b2sums=('bf774f5e65d5bd789c6ea00f87d260f9c19232c3794c32857732b647d609cc87936b1f8c1c261dac1f021536bc4e14574d5b14458d8972ff0b0fdc25d7597c1d')

_sourcedirectory="$_projectname-$pkgver"

check() {
	_checkoutput="$(fc-scan "$srcdir/$_sourcedirectory/fonts/materialdesignicons-webfont.ttf")"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'family: "Material Design Icons"'
}

package() {
	install -dm755 "$pkgdir/usr/share/fonts/TTF/$pkgname/"
	install -Dm644 "$srcdir/$_sourcedirectory/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/$pkgname/materialdesignicons-webfont.ttf"
}
