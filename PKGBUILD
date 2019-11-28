# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.11
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt' 'python-inform' 'python-shlib')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$pkgname"
license=('GPL3')
source=("https://github.com/KenKundert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0f8a0e736b20d7397f8d7f0fc0b9601ec56e02231a1b978ae11063f83ed3795b')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
