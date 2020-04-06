pkgname=python2-repoze.lru
pkgver=0.7
pkgrel=4
pkgdesc="A tiny LRU cache implementation and decorator (python-2.x)"
arch=('any')
url="https://pypi.python.org/pypi/repoze.lru"
license=("custom:BSD")
depends=('python')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=("https://pypi.io/packages/source/r/repoze.lru/repoze.lru-$pkgver.tar.gz")
sha512sums=('c4d8b015931c4265fa8559f99c9d5016835574b368ebe0d49fe503afe908020b2bf29836606134e00c6c0aa436d52a00bb73d6ab80e98d0802f54bd2e4686476')

build() {
  cd "$srcdir"/repoze.lru-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/repoze.lru-$pkgver
  python2 setup.py test
}

package() {
  cd repoze.lru-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
