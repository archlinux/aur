# Maintainer: Ruben Kelevra <ruben@freifunk-nrw.de>

pkgname=python-static3
pkgver=0.7.0
pkgrel=0
#epoch=1
pkgdesc="This library provides an easy way to include static content in your WSGI applications."
arch=(any)
url="https://github.com/rmohr/static3"
license=('LGPL2')
depends=('python' 'python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rmohr/static3/archive/v${pkgver}.tar.gz")
sha512sums=('fbd1aa76496c928128c0099fc2cd1c8fff6a6db29c8e329c4414223876e529ce1fb6d47491e584f89cebba02c69463e9ba5f14848e1f12676eebd0ea7a7a2559')
sname=static3

check() {
    cd "$sname-$pkgver"

    python setup.py test || true
}

build() {
    cd "$sname-$pkgver"

    python setup.py build
}

package() {
    cd "$sname-$pkgver"

    python setup.py install --root="${pkgdir}" --optimize=1

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/python-static3"
}
