# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=cruft
pkgver=2.9.0
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
sha1sums=('23c39f589b77ce7c90428a8ff71211dd55a1d3c3')
sha256sums=('550703c35b8125612ad89d93d176f29b3e362c19c74ed28895625afa9010fcb1')

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
