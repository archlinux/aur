# Maintainer: Phillip S. Kajubi <pintert3 at protonmail dot com>

pkgname=python-svgpathtools
_name=${pkgname#python-}
pkgver=1.6.1
pkgrel=1
pkgdesc='Manipulate and analyze SVG Path objects and Bezier curves'
arch=('any')
url='https://github.com/mathandy/svgpathtools'
license=('MIT')
depends=('python' 'python-numpy' 'python-svgwrite' 'python-scipy')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7054e6de1953e295bf565d535d585695453b09f8db4a2f7c4853348732097a3e')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
