# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Hoel Kervadec <hoel@kervadec.bzh>

_pkgname=pyScss
pkgname=python-pyscss
pkgver=1.4.0
pkgrel=1
pkgdesc="A SCSS compiler for Python"
arch=("any")
license=("GPL")
url="https://github.com/Kronuz/pyScss"
depends=("python")
makedepends=("python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("e2df85288ab5424df8748167c81dd7cca4578a06b47d3e0df4d56fdf2314b71ca9e56634d71daec316a1f492c02018dec78ad421a2251bab5bfdf6fceb1058cd")


build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
