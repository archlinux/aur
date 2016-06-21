# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=0.5.1
pkgrel=1
pkgdesc="A pep8 equivalent for bash scripts"
arch=('any')
makedepends=('setuptools')
depends=('python'
         'python-pbr'
         'python-babel')
url="https://github.com/openstack-dev/${pkgname}"
license=('Apache')
source=("https://github.com/openstack-dev/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('44fa6645fd7d5169c40747714986f1093ed24e2474e4a368c2695bf339c1551e')

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
