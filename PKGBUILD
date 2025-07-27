# Maintainer: Phillip S. Kajubi <pintert3 at kalabentate dot com>

pkgname=python-svgpathtools
_name=${pkgname#python-}
pkgver=1.7.1
pkgrel=1
pkgdesc='Manipulate and analyze SVG Path objects and Bezier curves'
arch=('any')
url='https://github.com/mathandy/svgpathtools'
license=('MIT')
depends=('python' 'python-numpy' 'python-svgwrite' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('beaef20fd78164aa5f0a7d4fd164ef20cb0d3d015cdec50c8c168e9d6547f041')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm 644 LICENSE2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE2.txt"
}

# vim:set ts=2 sw=2 et:
