# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-block_tracing
_name=block_tracing
pkgver=1.0.1
pkgrel=3
pkgdesc="Protect process memory"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/block_tracing"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9faa009a702a8f2f605ebb78314d5ca2a2a93543d061038a3d3a978c93385e68')

build() {
	cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
