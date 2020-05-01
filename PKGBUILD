# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: William Turner <willtur.will@gmail.com>

pkgname=python-mutatormath
_pkgname=MutatorMath
pkgver=3.0.1
pkgrel=1
pkgdesc='Piecewise linear interpolation in multiple dimensions with multiple, arbitrarily placed, masters'
arch=('any')
url='https://github.com/LettError/MutatorMath'
license=('BSD')
depends=('python' 'python-fonttools' 'python-defcon' 'python-fontmath')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864')

check() {
  cd "$_pkgname-$pkgver"
  python setup.py test
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
