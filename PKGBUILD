# Maintainer: mcol <mcol at posteo dot net>

# PKGBUILD @ mcol.xyz/code/python-seriate

pkgname=python-seriate
pkgver=1.1.2
pkgrel=1
pkgdesc="Optimal ordering of elements in a set given their distance matrix."
arch=('any')
url="https://github.com/src-d/seriate"
license=('Apache2')
depends=('python-or-tools' 'python-numpy')
makedepends=('python-setuptools')
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('5e031e865398fbe24aebdbb4a2e0015447aec50478830850f29d38660fd266e3')

build() {
    cd "${srcdir}/seriate-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/seriate-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
