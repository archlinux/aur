# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-lazr-restfulclient PKGBUILD by ValHue <vhuelamo at gmail dot com>

_pkgname="lazr.restfulclient"
pkgname=("python-lazr-restfulclient")
pkgver="0.14.2"
pkgrel="1"
pkgdesc="A programmable client library that takes advantage of the commonalities among lazr.restful web services to provide added functionality on top of wadllib."
arch=('any')
url="https://launchpad.net/$_pkgname"
license=('LGPL3')
makedepends=('python-setuptools')
depends=('python-lazr-uri' 'python-zope-interface' 'python-setuptools'
		 'python-httplib2' 'python-simplejson' 'python-wadllib' 'python-oauth')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('1ee3acf3bb38861546251f2f158a5e5df403d93b4b040b08c3f297e24b3a035a'
            'SKIP')
validpgpkeys=('AC0A4FF12611B6FCCF01C111393587D97D86500B') 

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
