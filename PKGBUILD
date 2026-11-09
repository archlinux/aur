# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=8.0.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD-3-Clause')
depends=('python-social-auth-core' 'python-django' 'python-asgiref')
makedepends=('python-build' 'python-setuptools' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('669e6157067509fa68c137a5ad62031da2fed3246906fc7452b863741a997a96ac8775e85d1133401be3deaf72a04ed321009af57cb38f9c2fc22cc773155213')

build() {
    cd social-app-django-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd social-app-django-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*whl

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
