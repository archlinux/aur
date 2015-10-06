#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letsencrypt-git
_pkgname=letsencrypt
pkgver=3117.63dc3cb
pkgrel=1
pkgdesc="A utility that works alongside Apache and nginx to automatically obtain a certificate and convert a website to HTTPS"
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('python2' 'augeas' 'ca-certificates' 'dialog' 'openssl' 'gcc' 'libffi' 'git'
         'python2-cffi' 'python2-configargparse' 'python2-configobj' 'python2-acme'
         'python2-cryptography' 'python2-enum34' 'python2-idna' 'python2-ipaddress'
         'python2-mock' 'python2-ndg-httpsclient' 'python2-parsedatetime' 'python2-psutil'
         'python2-pyasn1' 'python2-pycparser' 'python2-service-identity' 'python2-pyopenssl'
         'python2-pyparsing' 'python2-pyRFC3339' 'python2-pythondialog' 'python2-pytz'
         'python2-requests' 'python2-setuptools' 'python2-six' 'python2-werkzeug'
         'python2-wheel' 'python2-zope-interface' 'python2-zope-event' 'python2-zope-component')
makedepends=('python-virtualenv')
source=("${_pkgname}"::"git+https://github.com/${_pkgname}/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root="${pkgdir}"
}
