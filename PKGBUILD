# Maintainer: loathingkernel <username ta gmail tod com>

pkgname=python-pandarallel
pkgver=1.6.1
pkgrel=1
pkgdesc="A simple and efficient tool to parallelize Pandas operations on all available CPUs"
arch=('x86_64')
url="https://github.com/nalepae/pandarallel"
license=('BSD')
depends=('python-pandas' 'python-dill' 'python-setuptools')
makedepends=('python')
source=("pandarallel-$pkgver.tar.gz::https://github.com/nalepae/pandarallel/archive/v$pkgver.tar.gz")
sha256sums=('660faf89793c0234450e01e08f8712d2d624b40f4343d3d314f22f2b4e28074f')

build() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
