# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.17
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt'  'python-inform' 'python-quantiphy' 'python-shlib' )
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$pkgname"
license=('GPL3')
source=("https://github.com/KenKundert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('77964a59ddfc974860b09afeeaf50b20927be4473d027fd6610d801ebbaaa4ed')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
