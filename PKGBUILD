# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-lazr-restfulclient PKGBUILD by ValHue <vhuelamo at gmail dot com>

_pkgname="lazr.restfulclient"
pkgname=("python-lazr-restfulclient")
pkgver="0.14.4"
pkgrel="1"
pkgdesc="A programmable client library that takes advantage of the commonalities among lazr.restful web services to provide added functionality on top of wadllib."
arch=('any')
url="https://launchpad.net/$_pkgname"
license=('LGPL3')
makedepends=('python-setuptools')
depends=('python-lazr-uri' 
         'python-six' 
         'python-distro' 
         'python-setuptools'
		 'python-httplib2>=0.7.7' 
         'python-wadllib>=1.1.4' 
         'python-oauthlib')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('bf0fd6b2749b3a2d02711f854c9d23704756f7afed21fb5d5b9809d72aa6d087'
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
