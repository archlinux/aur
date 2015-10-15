#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-apache
pkgver=0.0.0.dev20151008
pkgrel=1
pkgdesc="Apache plugin for Let’s Encrypt client"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/${pkgname}"
depends=("letsencrypt=${pkgver}" "python2-acme=${pkgver}" 'python2-setuptools'
         'python2-mock' 'python2-zope-interface' 'python2-augeas' 'python2-zope-component')
conflicts=("letsencrypt-git")
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('4d79002cb1f226705ea9c4851f81150a')

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
