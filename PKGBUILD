# Maintainer: loathingkernel <username ta gmail tod com>

pkgname=python-pandarallel
pkgver=1.4.5
pkgrel=1
pkgdesc="A simple and efficient tool to parallelize Pandas operations on all available CPUs"
arch=('x86_64')
url="https://github.com/nalepae/pandarallel"
license=('BSD')
depends=('python-pandas' 'python-dill' 'python-setuptools')
makedepends=('python')
source=("pandarallel-$pkgver.tar.gz::https://github.com/nalepae/pandarallel/archive/v$pkgver.tar.gz")
sha256sums=('df732f788679887ce8c741a76da95580906484025a09e40075d71d9f84994f27')

build() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/pandarallel-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
