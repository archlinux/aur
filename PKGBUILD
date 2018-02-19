# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=cdrip
pkgver=3.0
pkgrel=0
pkgdesc="A cdparanoia, lame and musicbrainz.org frontend written in python."
arch=("any")
url="https://github.com/the-isz/cdrip"
license=("GPL")
depends=("python" "python-musicbrainzngs" "python-eyed3" "python-discid" "cdparanoia")
options=(!emptydirs)
source=("https://github.com/the-isz/$pkgname/tarball/$pkgver")
md5sums=("679812fb7adc3df1148e7b5ae2c1a59a")

package() {
  cd "$srcdir/the-isz-$pkgname-0404ce2/deployment"

  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/cdrip.py" "$pkgdir/usr/bin/cdrip"
}
