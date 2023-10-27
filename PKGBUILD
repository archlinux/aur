# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=5.3.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD')
depends=('python-social-auth-core>=4.4.1' 'python-django')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b87298b0fd468e66610f70453d5ffbfc81e5b0d26de099e56eec3cf1ab7625dc')

build() {

    cd social-app-django-${pkgver}
    python setup.py build

}

package() {

    cd social-app-django-${pkgver}
    python setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
