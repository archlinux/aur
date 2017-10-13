# Maintainer: Iru Cai <mytbk920423@gmail.com>
pkgname=qqwry
pkgver=20171010
pkgrel=1
pkgdesc="IP to location data file qqwry.dat"
arch=('any')
url="http://www.cz88.net/"
license=('custom')
makedepends=('innoextract')
source=('http://update.cz88.net/soft/setup.zip')
md5sums=('SKIP') # f0c3328429a66333f78a492fa31b3c01 at 2017-10-10

build() {
  cd "$srcdir"

  innoextract setup.exe
}

package() {
  install -d "$pkgdir/usr/share/qqwry/"
  install -d "$pkgdir/usr/share/licenses/qqwry"
  cp "$srcdir/app/qqwry.dat" "$pkgdir/usr/share/qqwry/"
  # add license file
  iconv -f gbk "$srcdir/app/License.txt" \
        -o "$pkgdir/usr/share/licenses/qqwry/LICENSE"
}

# vim:set ts=2 sw=2 et:
