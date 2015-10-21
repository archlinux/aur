#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-nginx
pkgver=0.0.0.dev20151021
pkgrel=1
pkgdesc="Nginx plugin for Let’s Encrypt client"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/${pkgname}"
depends=("letsencrypt=${pkgver}" "python2-acme=${pkgver}" 'python2-setuptools'
         'python2-mock' 'python2-zope-interface' 'python2-pyparsing' 'python2-pyopenssl' )
conflicts=("letsencrypt-git")
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('625979321aed2d4f17b8a264e0395159')

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
