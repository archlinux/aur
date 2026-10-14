# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=7.1.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD-3-Clause')
depends=('python-social-auth-core' 'python-django' 'python-asgiref')
makedepends=('python-build' 'python-setuptools' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('4045762d62875406537c3cc1202e64df6e9af4b3c2857760a9d2f3a0a6e6b342c71a6e7ce19e96647a1b33da9643656eeb1a03fde4cfd2b9a3159e8002312a18')

build() {
    cd social-app-django-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd social-app-django-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*whl

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
