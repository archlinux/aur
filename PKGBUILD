#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-nginx
pkgver=0.0.0.dev20151024
pkgrel=1
pkgdesc="Nginx plugin for Let’s Encrypt client"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/${pkgname}"
depends=('letsencrypt' 'python2-acme' 'python2-setuptools'
         'python2-mock' 'python2-zope-interface' 'python2-pyparsing' 'python2-pyopenssl')
# To be precise: This package, letsencrypt and python2-acme shell all be at the same version,
# though for easier package management, it is omitted in this PKGBUILD
conflicts=("letsencrypt-git")
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('15a176e1c6faabe73f5a3543fcbe097b')

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
