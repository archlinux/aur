# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=cruft
pkgver=2.12.0
pkgrel=1
pkgdesc='Maintain all the necessary boilerplate for packaging and building projects separate from the code you intentionally write. Fully compatible with existing Cookiecutter templates'
arch=('any')
url='https://cruft.github.io/cruft/'
license=('MIT')
depends=('python'
				 'python-click'
				 'python-cookiecutter'
				 'python-gitpython'
				 'python-typer')
optdepends=('python-toml: specify patterns to ignore in toml files')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('caa92f51a79e1f3b21f8345f89afd01fda2698a7')
sha256sums=('57455d33a60684c945d501dcea2b1c57dc0fb200a0090f07c83da1603382cbb1')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
