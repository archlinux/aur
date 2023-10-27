# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-social-auth-app-django
pkgver=5.2.0
pkgrel=1
pkgdesc='Python Social Auth Django component'
arch=('any')
url='https://github.com/python-social-auth/social-app-django'
license=('BSD')
depends=('python-social-auth-core>=4.4.1' 'python-django')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2b12e2ef5d49f2fe2995fb0dfb8d59021072938d4d06784632c311471974e0f2')

build() {

    cd social-app-django-${pkgver}
    python setup.py build

}

package() {

    cd social-app-django-${pkgver}
    python setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/social-app-django-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
