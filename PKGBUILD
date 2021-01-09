# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-browserstack-local
_pkgname=browserstack-local
pkgver=1.2.3
pkgrel=1
pkgdesc='Python bindings for BrowserStack Local'
arch=(any)
url="http://github.com/browserstack/$_pkgname-python"
license=('MIT')
depends=('python' 'python-psutil')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7cc7e65d996b616524d23a659fc6470b1bf8edc75fa8ec9d88108d4d9a4e0c0f')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
