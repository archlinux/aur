# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=0.3.2
pkgrel=1
pkgdesc="A pep8 equivalent for bash scripts"
arch=('any')
makedepends=('setuptools')
depends=('python')
url="https://github.com/openstack-dev/${pkgname}"
license=('Apache')
source=(http://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8e1d2da26458f90389afb04069aea69e5db84370b27c18fb47dc45253e5513db')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}
