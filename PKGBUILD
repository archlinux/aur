 # Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=python-daemonocle
pkgver=0.8
pkgrel=2
pkgdesc="Python library for creating Unix daemons"
url="https://github.com/jnrbsn/daemonocle"
depends=('python')
optdepends=('python-click=2.5'
            'python-psutil=2.1.1')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/daemonocle/daemonocle-$pkgver.tar.gz")
sha256sums=('b5fd390a3cf617c9113be02097892d2a0e967d99cc4ec9926671e20e8c03520c')

build() {
  cd "$srcdir/daemonocle-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/daemonocle-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
