# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=5.1.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD')
depends=('python-social-auth-core>=4.1.0')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1c972a835f3a676f79dcde9dcc2ded39a2cc2a5afbddc2d952d4a5ec264e7db')

build() {

    cd social-app-django-${pkgver}
    python setup.py build

}

package() {

    cd social-app-django-${pkgver}
    python setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
