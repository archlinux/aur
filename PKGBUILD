# Maintainer: mickybart <mickybart at pygoscelis dot org>

pkgname=('python-atlasbroker')
pkgver='2.0.0'
pkgrel=1
pkgdesc="Atlas Broker for Kubernetes Service Catalog"
url="http://github.com/mickybart/python-atlasbroker"
depends=('python' 'python-atlasapi' 'python-pwgen' 'python-pymongo' 'python-openbrokerapi' 'python-flask')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("${pkgname}::git+https://github.com/mickybart/python-atlasbroker#tag=${pkgver}")
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

