# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=tclint
pkgver=0.9.0
pkgrel=1
pkgdesc="A collection of Tcl CLI tools: linter, formatter, language server"
arch=('any')
url="https://github.com/nmoroze/tclint"
license=('MIT')
depends=('python>=3.10' 'python-ply' 'python-pathspec' 'python-importlib-metadata' 'python-pygls' 'python-voluptuous')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools-scm' 'git')
source=("${pkgname}-${pkgver}::git+https://github.com/nmoroze/tclint.git#tag=v${pkgver}")
sha256sums=('f888d1cbbc1f6e093583edc9e8ad8b3c75dc6e00b6ed873583bba7a021ed797d')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
