# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=pcpp
pkgname=python-$_name
pkgver=1.30
pkgrel=5
pkgdesc='A C99 preprocessor with partial preprocessing capabilities writen in Python'
arch=(any)
url="https://github.com/ned14/$_name"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_archive.tar.gz")
sha256sums=('5af9fbce55f136d7931ae915fae03c34030a3b36c496e72d9636cedc8e2543a1')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
