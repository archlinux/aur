# Maintainer: Alejandro Fernandez Huguet <https://github.com/RinsedSloth>
pkgname=qmk
pkgver=0.0.14
pkgrel=1
pkgdesc="CLI tool for customizing supported mechanical keyboards."
arch=('any')
url="https://qmk.fm/"
license=('MIT')
depends=(
	'python-appdirs'
	'python-argcomplete'
	'python-colorama'
	)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/q/qmk/qmk-${pkgver}.tar.gz")
md5sums=("ba195b6cc301874a93c52a3815c64068")
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
