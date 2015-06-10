# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=thue
pkgver=1.5_2012.0916
pkgrel=1
pkgdesc='Thue programming language'
arch=('any')
url='http://catseye.tc/node/Thue.html'
license=('custom:PD')
depends=('python')
source=("http://catseye.tc/distfiles/$pkgname-${pkgver/_/-}.zip")
sha256sums=('28834a581bbf75822f965e97ff2717c7de705252fb4cebc306f4a1789fdfebc5')

prepare() {
  2to3 -w -n "$pkgname-${pkgver/_/-}/src/thue.py" >/dev/null 2>&1
}

package() {
  cd "$pkgname-${pkgver/_/-}"
  install -Dm755 src/thue.py "$pkgdir/usr/bin/thue"
  install -Dm644 doc/license.txt "$pkgdir/usr/share/licenses/thue/LICENSE"
  install -Dm644 doc/thue.txt "$pkgdir/usr/share/doc/thue/REFERENCE"
  install -Dm644 README.markdown "$pkgdir/usr/share/doc/thue/README.md"
  cp -r eg "$pkgdir/usr/share/doc/thue/examples"
}

# vim:set ts=2 sw=2 et:
