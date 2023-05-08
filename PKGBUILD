# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-cli-exit-tools
_name=cli_exit_tools
pkgver=1.2.3.2
pkgrel=3
pkgdesc="Small toolset to properly exit a cli application"
url="https://github.com/bitranox/cli_exit_tools"
depends=(
    'python'
    'python-click'
    #'python-lib-detect-testenv'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('60e798a219c5e3bf42ca309575afdbae22808b55bcf030554a61ea21c68fc206')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
