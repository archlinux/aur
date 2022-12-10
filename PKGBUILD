# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=2.1.1
pkgrel=1
pkgdesc="Code style enforcement for bash programs"
arch=('any')
makedepends=('python-setuptools')
depends=('python'
         'python-pbr')
url="https://github.com/openstack/${pkgname}"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a28fda309b4d7577a5d83a9f0ea8b305cb8fc626d5b320ed1bcb875ed7c576a9')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    PBR_VERSION=$pkgver \
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    PBR_VERSION=$pkgver \
    python setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}
