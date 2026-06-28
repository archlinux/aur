# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=6.0.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD-3-Clause')
depends=('python-social-auth-core' 'python-django' 'python-asgiref')
makedepends=('python-build' 'python-setuptools' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1118a1cc6fae3d3ae80ef5c66f9cb6e4cf87cae3bea1ef2b70dc0519026d9789099fcd1a63e78a00564a412fff14a5e36fb258ca20ca09a30bce847cba8f5df2')

build() {
    cd social-app-django-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd social-app-django-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*whl

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
