# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>

pkgname=python-tendo
_pkg="${pkgname#python-}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Adds basic functionality not (yet) provided by Python"
arch=('any')
url="https://github.com/pycontribs/tendo"
license=('PSF-2.0')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools-scm')
source=("$_pkg::git+https://github.com/pycontribs/$_pkg.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $_pkg
	python -m build --wheel
}

package() {
  cd $_pkg
	python -m installer --prefix=/usr --destdir="$pkgdir" dist/$_pkg-$pkgver-*.whl
}
