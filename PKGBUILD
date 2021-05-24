# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-xsdata'
_pkgname='xsdata'
pkgver=21.5
pkgrel=1
pkgdesc='Naive XML bindings for python'
url='https://xsdata.readthedocs.io'
checkdepends=('python-click-default-group' 'python-docformatter' 'python-pytest' 'python-pytest-benchmark' 'python-toposort' 'python-untokenize')
depends=()
makedepends=('python-setuptools')
optdepends=('python-click'
    'python-toposort')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('926cd20f2e1e84b3ae980f5ca26d11166550dbe72326740da474485a8879be4b')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver"
  pytest tests/
}

