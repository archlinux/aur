# Maintainer: thepasto <thepasto@gmail.com>

pkgname=certbot-dns-dynu
pkgver=0.0.6
pkgrel=1
pkgdesc="Dynu DNS Authenticator plugin for Certbot"
arch=('any')
url="https://github.com/bikram990/${pkgname}"
license=('Apache')
depends=('certbot' 'python' 'dns-lexicon' 'python-zope-interface' 'python-dnspython' 'python-requests' 'python-mock')
makedepends=('python-setuptools')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('90cb19f67b0690f98df7958578040f482dfaa06f997461cfe18caea1ff606534')

prepare() {
        cd "${pkgname}-${pkgver}"
        #sed -i 's/dns-lexicon>=3.2.4,<=3.5.6/dns-lexicon>=3.2.4/g' setup.py
}

build() {
        cd "${pkgname}-${pkgver}"
        python setup.py build
}

package() {
        cd "${pkgname}-${pkgver}"
        python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
