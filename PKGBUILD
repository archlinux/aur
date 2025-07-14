# Maintainer GI_Jack <GI_Jack@hackermail.com>
# Contributer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: BlackArch

pkgname='python-bs4'
_pkgname='bs4'
pkgver='0.0.2'
pkgrel=3
pkgdesc='This is a dummy package designed to prevent namesquatting on PyPI. You should install beautifulsoup4 instead.'
arch=('any')
url='https://pypi.python.org/pypi/bs4/'
license=('custom:unknown')
depends=('python' 'python-beautifulsoup4' 'python-hatchling')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a48685c58f50fe127722417bae83fe6badf500d54b55f7e39ffe43b798653925')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
