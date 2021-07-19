# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python2-incremental
pkgver=21.3.0
pkgrel=1
pkgdesc="A small library that versions your Python projects."
url="https://github.com/twisted/incremental"
arch=('any')
provides=('python2-incremental')
depends=('python2')
makedepends=('python2-setuptools')
_name="${pkgname#python2-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
