# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=8.1.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD-3-Clause')
depends=('python-social-auth-core' 'python-django' 'python-asgiref')
makedepends=('python-build' 'python-setuptools' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('98dae44331458a27e738875d7f1960937f1309e83fd08eb8ac5f0950706799ee47c5e6357abfbc1ceea4d0c53bfb74cf136307f7b88dd6f5b8b810595df69541')

build() {
    cd social-app-django-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd social-app-django-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*whl

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
