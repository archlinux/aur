# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='emborg'
pkgver=1.14
pkgrel=1
pkgdesc="Front-end to Borg backup"
arch=('any')
depends=('borg' 'python-appdirs' 'python-arrow' 'python-docopt' 'python-inform' 'python-shlib')
makedepends=('python-setuptools')
url="https://github.com/KenKundert/$pkgname"
license=('GPL3')
source=("https://github.com/KenKundert/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4396a69c2a18fb11dd88d942d6a2f42760cb87032fff26246f5e039db8bdd00f')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
