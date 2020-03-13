# Maintainer: loathingkernel <username ta gmail tod com>

pkgname=python-pandarallel
pkgver=1.4.6
pkgrel=1
pkgdesc="A simple and efficient tool to parallelize Pandas operations on all available CPUs"
arch=('x86_64')
url="https://github.com/nalepae/pandarallel"
license=('BSD')
depends=('python-pandas' 'python-dill' 'python-setuptools')
makedepends=('python')
source=("pandarallel-$pkgver.tar.gz::https://github.com/nalepae/pandarallel/archive/v$pkgver.tar.gz")
sha256sums=('1eb44d50cf6d2d6b500d07143707711413e5cf02d1ec73f34c086ce22d725b60')

build() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
