# Maintainer : Frederik Wegner <wegnerfrederik at gmail dot com>
_name="pyDeprecate"
_pkgname="pydeprecate"
_repourl="https://github.com/Borda/$_name"
pkgname=python-$_pkgname
pkgver=0.3.2
pkgrel=1
pkgdesc="Python module for deprecation documentation"
arch=('any')
url=$_repourl
license=('BSD')
depends=('python>=3.6')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
makedepends=(
	'python-setuptools'
	)
source=("$_repourl/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cd ${srcdir}/$_name-$pkgver
	install -D -m644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
