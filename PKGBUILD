# Maintainer: Luca Weiss <luca@z3ntu.xyz>
pkgname=lsip6
pkgver=0.1.0
pkgrel=1
pkgdesc="Find link-local IPv6 neighbors on point-to-point links"
arch=('any')
url="https://git.sr.ht/~martijnbraam/lsip6"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://git.sr.ht/~martijnbraam/lsip6/archive/$pkgver.tar.gz")
sha512sums=('f10a16653b61d29a046a62b19552ce08fee370dc9870fcccc06a3460efb7490a89986813b0f1fedf711bd13a5b72351e819a9f77aac2558398124b12e5815484')

build() {
    cd "lsip6-$pkgver"
    python setup.py build
}

package() {
    cd "lsip6-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
