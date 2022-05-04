_pkgname=dill
pkgname=pypy3-$_pkgname
pkgver=0.3.4
pkgrel=1
pkgdesc='serialize all of python'
arch=('any')
url='https://github.com/uqfoundation/dill'
license=('MIT')
optdepends=('python-objgraph: graph support')
depends=('pypy3')
makedepends=('pypy3-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/dill-$pkgver.tar.gz")
sha512sums=('1b1991909a9782382ecdb2ada13249c8b446d3558de69501280c816f7cd6c6728f9d3303c826461245ab9e42c43c02e4605142f25e09244bb7ccc9ca68a4b565')

build() {
  cd $_pkgname-$_pkgname-$pkgver

  pypy3 setup.py build
}

package() {
  cd $_pkgname-$_pkgname-$pkgver

  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

