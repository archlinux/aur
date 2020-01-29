# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Tarn Burton <twburton at gmail dot com>
# Contributor: Milo Mirate <mmirate at gmx.com>

_pkgname=Pweave
pkgname=python-pweave
pkgver=0.30.3
pkgrel=2
pkgdesc="scientific report generator and literate programming tool for Python"
arch=(any)
url="http://mpastell.com/pweave/"
license=('BSD')
depends=('ipython' 'jupyter-nbconvert' 'jupyter-nbformat'
         'python-ipykernel' 'python-jupyter_client'
         'python-markdown' 'python-pygments' 'python')
makedepends=('python-setuptools')
optdepends=('pygmentize: for linted output')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('5e5298d90e06414a01f48e0d6aa4c36a70c5f223d929f2a9c7e2d388451c7357')


build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
