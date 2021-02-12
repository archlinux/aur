# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=tvnamer
pkgver=3.0.2
pkgrel=1
pkgdesc='Automatic TV episode file renamer'
arch=('any')
url='https://github.com/dbr/tvnamer'
license=('Public domain')
depends=('python3' 'python-tvdb_api')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbr/tvnamer/archive/${pkgver}.tar.gz")
sha256sums=('7e18b50de3141a5b5d505f3003f2f20492008938c359017e2af529c4969ba15c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
