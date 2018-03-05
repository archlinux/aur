# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_name=milksnake
pkgname=python-milksnake
pkgver=0.1.2
pkgrel=1
pkgdesc='Python library that extends setuptools for binary extensions'
arch=('any')
url=https://github.com/getsentry/milksnake
license=('Apache')
depends=('python-cffi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha512sums=('18843b66d249d4d8d4dff222f01194c17c07eceb1a7aa117163046593542e613e442a19d3ecbe6bba9ea9e4ba3e59acb66909d4b68d1c96764c4b80750288e87')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
