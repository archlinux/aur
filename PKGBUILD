# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=distro-info-data
pkgver=0.59
pkgrel=1
pkgdesc="information about the distributions' releases (data files)"
arch=('any')
url="http://packages.debian.org/sid/distro-info-data"
license=('MIT')
checkdepends=('python')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_${pkgver}.tar.xz)
sha256sums=('4660edf1de1b18d016d41da969f9c003f45dcbeb2e39be426ba1cc260dea3326')

check() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -D -m 644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim:set ts=2 sw=2 et:
