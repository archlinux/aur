# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python2-tqdm
pkgver=4.48.0
pkgrel=2
pkgdesc='Fast, Extensible Progress Meter'
arch=('any')
license=('MIT' 'MPL')
url='https://github.com/tqdm/tqdm'
makedepends=('python2-setuptools')
checkdepends=('python2-nose' 'python2-coverage' 'python2-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tqdm/tqdm/archive/v$pkgver.tar.gz")
sha512sums=('2783725d2a06149f1d464826652ff46fc2114246fcbef170f24d39a97e17e84daa8cf01d2f91bf8eecd8551ceabe4eb38c932b5688e9018d1f92b1a10e487262')

prepare() {
  mv tqdm-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/tqdm-$pkgver-py2
  python2 setup.py build
}

package() {
  cd tqdm-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE

  mv "$pkgdir"/usr/bin/tqdm{,2}
}

# vim:set ts=2 sw=2 et:
