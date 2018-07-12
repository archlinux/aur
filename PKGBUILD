# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase=('statcode')
pkgname=('statcode')
_module='statcode'
pkgver='1.0.0'
pkgrel=2
pkgdesc="Like man pages, but for HTTP status codes"
url="https://github.com/shobrook/statcode"
depends=('python' 'python-urwid')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/s/statcode/statcode-${pkgver}.tar.gz")
sha256sums=('973bcf53ef9beedbb6d334dea5536af28b4fd02b5a2ed4b91cf2a256860dabe3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
