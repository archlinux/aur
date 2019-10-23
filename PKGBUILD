# Maintainer: Kewl <(rot13)xrjy@nygb.rh.bet>

pkgname='emborg'
pkgver=1.8
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt' 'python-inform' 'python-shlib')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$pkgname"
license=('GPL3')
source=("https://github.com/KenKundert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('525b0bbf77f20a296821338af16e54f83c2254923604579b853d663d4e4a7b2e')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
