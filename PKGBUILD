# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-browserstack-local
_pkgname=browserstack-local
pkgver=1.2.4
pkgrel=1
pkgdesc='Python bindings for BrowserStack Local'
arch=(any)
url="http://github.com/browserstack/$_pkgname-python"
license=(MIT)
depends=(python
         python-psutil)
makedepends=(python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('e9da7c11f0c60a65f2a655e96bef5d00b0fbb33a3a3532275c2e317821fb5fb2')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
