# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=tvnamer
pkgver=2.4
pkgrel=2
pkgdesc='Automatic TV episode file renamer'
arch=('any')
url='https://github.com/dbr/tvnamer'
license=('Public domain')
depends=('python3' 'python-tvdb_api')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbr/tvnamer/archive/${pkgver}.tar.gz")
sha256sums=('bddaba4b3887ab3b6777932457c8d8f65754b64de9a13b9987869e8e78573bb2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
