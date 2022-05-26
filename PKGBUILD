# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=cruft
pkgver=2.10.2
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
sha1sums=('4c31dbd68b8149b71d844072dcc0e1054853c60b')
sha256sums=('fe7aaace048df17efc0e597c8035cb0deaa7a8734a86eb8c6cca5388971a2a42')

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
