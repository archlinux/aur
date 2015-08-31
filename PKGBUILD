# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=tvnamer
pkgver=2.3
pkgrel=2
pkgdesc='Automatic TV episode file renamer'
arch=('any')
url='https://github.com/dbr/tvnamer'
license=('Public domain')
depends=('python2' 'tvdb_api')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbr/tvnamer/archive/${pkgver}.tar.gz")
sha256sums=('c28836f4c9263ee8ad6994788ad35f00e66fa1bd602e876364cd9b938f2843c8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
