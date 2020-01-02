# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=pypi2pkgbuild
pkgname=python-$_name
pkgver=0.2
pkgrel=2
pkgdesc="Convert PyPI packages to Arch Linux packages"
arch=('any')
url="https://github.com/anntzer/pypi2pkgbuild"
license=('MIT')
depends=(
	'namcap'
	'pkgfile'
	'python-pip'
	'python-wheel'
)
makedepends=('python-setuptools-scm')
conflicts=('python-pypi2pkgbuild-git')
source+=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3387180d2864f09e67429eeaa41d3b9fba95ec1dd5badaae54a550003db70f98')

package() {
	cd "$srcdir/$_name-$pkgver"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
