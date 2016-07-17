# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=0.5.1
pkgrel=2
pkgdesc="A pep8 equivalent for bash scripts"
arch=('any')
makedepends=('setuptools')
depends=('python'
         'python-pbr'
         'python-babel')
url="https://github.com/openstack-dev/${pkgname}"
license=('Apache')
source=("https://pypi.python.org/packages/22/3c/10efc0119b59e77c74e94eb9768f409b4ba25238a0e3082203bc5386793f/$pkgname-$pkgver.tar.gz")
sha256sums=('bcb2911c013f5d6d27413624e062079b7a6ec056581960b4a81cea72975d8434')

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
