# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-docformatter'
_pkgname='docformatter'
pkgver=1.4
pkgrel=1
pkgdesc='Format docstrings to follow PEP257'
url='https://github.com/myint/docformatter'
checkdepends=()
depends=('python-untokenize')
makedepends=('python-setuptools')
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('064e6d81f04ac96bc0d176cbaae953a0332482b22d3ad70d47c8a7f2732eef6f')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver"
  python test_docformatter.py
}

