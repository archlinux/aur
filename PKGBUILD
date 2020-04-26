# Maintainer: loathingkernel <username ta gmail tod com>

pkgname=python-pandarallel
pkgver=1.4.8
pkgrel=1
pkgdesc="A simple and efficient tool to parallelize Pandas operations on all available CPUs"
arch=('x86_64')
url="https://github.com/nalepae/pandarallel"
license=('BSD')
depends=('python-pandas' 'python-dill' 'python-setuptools')
makedepends=('python')
source=("pandarallel-$pkgver.tar.gz::https://github.com/nalepae/pandarallel/archive/v$pkgver.tar.gz")
sha256sums=('b03c7d95e4530dde0e40738171f57296f6f8e5a16ab32b43169236fc8b4f6e7c')

build() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
