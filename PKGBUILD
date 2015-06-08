# Maintainer: mirandir <mirandir@orange.fr>

pkgname=infinity-background
pkgver=0.0.5
_minpkgver=9.fc20
pkgrel=9
pkgdesc="Fedora 8 Infinity background for Gnome. Changes color based upon the time of day"
arch=('any')
license=('GPL')
depends=()
makedepends=('rpmextract')
url=("http://fedoraproject.org/wiki/Artwork/F8Themes/Infinity")
source=(http://arm.koji.fedoraproject.org//packages/fedorainfinity-backgrounds/$pkgver/$_minpkgver/noarch/fedorainfinity-backgrounds-$pkgver-$_minpkgver.noarch.rpm)
sha256sums=('2650e9b44c07dbed6325352946ba295b6045a6c4cab9589d6606797b5f21421b')

package() {
  cd "$srcdir"
  rpmextract.sh fedorainfinity-backgrounds-$pkgver-$_minpkgver.noarch.rpm || return 1

  install -d $pkgdir/usr/share/

  cp -r usr/ $pkgdir/
}
