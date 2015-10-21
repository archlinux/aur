#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt
pkgver=0.0.0.dev20151021
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python2' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git' 'python2-augeas'
         'python2-cffi' 'python2-configargparse' 'python2-configobj' "python2-acme=${pkgver}"
         'python2-cryptography' 'python2-enum34' 'python2-idna' 'python2-ipaddress'
         'python2-mock' 'python2-ndg-httpsclient' 'python2-parsedatetime' 'python2-psutil'
         'python2-pyasn1' 'python2-pycparser' 'python2-service-identity' 'python2-pyopenssl'
         'python2-pyparsing' 'python2-pyrfc3339' 'python2-pythondialog' 'python2-pytz'
         'python2-requests' 'python2-setuptools' 'python2-six' 'python2-werkzeug'
         'python2-wheel' 'python2-zope-interface' 'python2-zope-event' 'python2-zope-component')
optdepends=("letsencrypt-apache=${pkgver}: Apache plugin for Let’s Encrypt client"
            "letsencrypt-nginx=${pkgver}: Nginx plugin for Let’s Encrypt client")
conflicts=("${pkgname}-git")
source=("https://pypi.python.org/packages/source/l/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('14cc485de72856a2413639674406d7f8')

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
