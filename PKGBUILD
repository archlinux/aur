# Maintainer: mickybart <mickybart at pygoscelis dot org>

pkgname=('python-atlasapi')
pkgver='0.5.4'
pkgrel=1
pkgdesc="Expose MongoDB Atlas Cloud provider APIs"
url="http://github.com/mickybart/python-atlasapi"
depends=('python' 'python-requests' 'python-dateutil')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("${pkgname}::git+https://github.com/mickybart/python-atlasapi#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

