# Maintainer: Dmitriy Geels <dmitriy.geels at gmail dot com>

pkgname=certbot-dns-dynadot
pkgver=0.2.1
pkgrel=1
pkgdesc="A certbot DNS plugin to obtain certificates using dynadot."
arch=("any")
url="https://github.com/dmig/certbot-dns-dynadot"
license=("Apache-2.0")
depends=('python-requests' 'certbot')
provides=("${pkgname}")
makedepends=("python-setuptools")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('SKIP')

build(){
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py build
}

package(){
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}
