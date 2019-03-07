# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=cdrip
pkgver=3.0
pkgrel=1
pkgdesc="A cdparanoia, lame and musicbrainz.org frontend written in python."
arch=("any")
url="https://gitlab.com/the_isz/cdrip"
license=("GPL")
depends=("python" "python-musicbrainzngs" "python-eyed3" "python-discid" "cdparanoia")
options=(!emptydirs)
source=("https://gitlab.com/the_isz/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=("0ab1c2223c66c4b6bf92cd3820d7eb33")

package() {
  cd "$srcdir/$pkgname-$pkgver/deployment"

  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/cdrip.py" "$pkgdir/usr/bin/cdrip"
}
