# Maintainer: arielzn <arielzn@riseup.net>

pkgbase='python-archspec'
pkgname=('python-archspec')
_module='archspec'
pkgver='0.2.1'
pkgrel=1
pkgdesc="A library for detecting, labeling, and reasoning about microarchitectures"
url="https://github.com/archspec/archspec"
depends=('python')
makedepends=('python-poetry')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0974a8a95831d2d43cce906c5b79a35d5fd2bf9be478b0e3b7d83ccc51ac815e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer -d "$pkgdir" dist/*.whl
}
