# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=7.2.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD-3-Clause')
depends=('python-social-auth-core' 'python-django' 'python-asgiref')
makedepends=('python-build' 'python-setuptools' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('66be07adb9506dc608d40feb8c68e0a75595f26a9d9d34d5c8132dc81e18166d2c0fa3f98fc1a56e52eaff8a322099a8d6b57389856e20c3a0fa8e2004658bbd')

build() {
    cd social-app-django-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd social-app-django-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*whl

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
