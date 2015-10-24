#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-apache
pkgver=0.0.0.dev20151024
pkgrel=1
pkgdesc="Apache plugin for Let’s Encrypt client"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/${pkgname}"
depends=('letsencrypt' 'python2-acme' 'python2-setuptools'
         'python2-mock' 'python2-zope-interface' 'python2-augeas' 'python2-zope-component')
# To be precise: This package, letsencrypt and python2-acme shell all be at the same version,
# though for easier package management, it is omitted in this PKGBUILD
conflicts=("letsencrypt-git")
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5fca12cb529a3d96f3d5df1389a65372')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py build
}

#check() {
#    cd "${srcdir}/${pkgname}-${pkgver}"
#    python2 setup.py test
#}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}
