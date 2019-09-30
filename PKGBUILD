# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.5
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt' 'python-inform' 'python-shlib')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$pkgname"
license=('GPL3')
source=("https://github.com/KenKundert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('38d91c9d05238c8c030a49925b9005a936d76566efdfe0655a76e0fd09dbafa1')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
