# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=0.6.0
pkgrel=1
pkgdesc="A pep8 equivalent for bash scripts"
arch=('any')
makedepends=('python-setuptools')
depends=('python'
         'python-pbr'
         'python-babel')
url="https://github.com/openstack-dev/${pkgname}"
license=('Apache')
source=("https://files.pythonhosted.org/packages/d1/24/dff6f791b3e3873960cb4471212d67be1338702c96711e81ae6d208ed5ab/$pkgname-$pkgver.tar.gz")
sha256sums=('f01822a7295f1dfd197f67b4385c683d2eea293fa101ad15cf5e8572c0d45755')

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
