# Maintainer: Stefan Ott <arch at desire dot ch>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=tvnamer
pkgver=3.0.4
pkgrel=1
pkgdesc='Automatic TV episode file renamer'
arch=('any')
url='https://github.com/dbr/tvnamer'
license=('Public domain')
depends=('python3' 'python-tvdb_api')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dbr/tvnamer/archive/${pkgver}.tar.gz")
sha256sums=('a8e20d0dcbfe891e691131d80bcc692e645e47ba706f2f06fff33691911a6d05')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
