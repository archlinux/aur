# Maintainer: thepasto <thepasto@gmail.com>

pkgname=certbot-dns-dynu
pkgver=0.0.4
pkgrel=1
pkgdesc="Dynu DNS Authenticator plugin for Certbot"
arch=('any')
url="https://github.com/bikram990/${pkgname}"
license=('Apache')
depends=('certbot' 'python' 'dns-lexicon' 'python-zope-interface' 'python-dnspython' 'python-requests' 'python-mock')
makedepends=('python-setuptools')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cb12d210f8c3d7aa020f9c41a8c68f692d4426b51781b1fb5beb4e3d0003e286')

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
