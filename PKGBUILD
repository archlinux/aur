# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=0.4.0
pkgrel=1
pkgdesc="A pep8 equivalent for bash scripts"
arch=('any')
makedepends=('setuptools')
depends=('python'
         'python-pbr'
         'python-babel')
url="https://github.com/openstack-dev/${pkgname}"
license=('Apache')
source=(http://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('1b93238ad531aadb7e501b541958dda05bf0794be866fd53d5ffb2182c1248a6')

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
