# Maintainer: loathingkernel <username ta gmail tod com>

pkgname=python-pandarallel
pkgver=1.6.5
pkgrel=1
pkgdesc="A simple and efficient tool to parallelize Pandas operations on all available CPUs"
arch=('x86_64')
url="https://github.com/nalepae/pandarallel"
license=('BSD')
depends=('python-pandas' 'python-dill' 'python-setuptools')
makedepends=('python')
source=("pandarallel-$pkgver.tar.gz::https://github.com/nalepae/pandarallel/archive/v$pkgver.tar.gz")
sha256sums=('fe8808f65d44463f6cd4cc32f8b871f26aaedb2cbb1080a6568c438504adbb10')

build() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
