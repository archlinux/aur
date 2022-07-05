# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python2-decorator
pkgver=4.4.2
pkgrel=1
pkgdesc="Decorators for Humans"
url="https://github.com/micheles/decorator"
arch=('any')
provides=('python2-decorator')
depends=('python2')
makedepends=('python2-setuptools')
_name="${pkgname#python2-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e3a62f0520172440ca0dcc823749319382e377f37f140a0b99ef45fecb84bfe7')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
