# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=1.3
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-distribute')
source=($url/archive/${pkgver}.tar.gz)
sha256sums=('c6bf5fbbf7b80aa765124ae638fa2d44e7c064b2a3fd6f8dd3b495b99a9d083a')

build(){
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
    install -D LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
