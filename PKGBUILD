# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pybrowserstack-screenshots
_pkgname=pybrowserstack-screenshots
pkgver=0.1
pkgrel=1
pkgdesc='api wrapper and python client for Browserstack Screenshots, including phantomCSS support'
arch=(any)
url="http://github.com/cmck/$_pkgname"
license=('MIT')
depends=('python' 'python-pillow' 'python-simplejson' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('530cba97ff4131ec9cf003bf7b63fa48d7dd81a2e63bb75dbbd771f1f19f7c9a')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
