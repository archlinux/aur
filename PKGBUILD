# Maintainer: Ainola
# Contributor: Sergey Mastykov

pkgname=linkchecker
pkgver=9.4.0
pkgrel=6
pkgdesc="Check websites for broken links."
arch=('x86_64')
url="https://github.com/linkcheck/linkchecker"
license=('GPL2')
depends=('python2-requests' 'python2-dnspython' 'python2-xdg')
optdepends=(
    'python2-argcomplete: For command-line completion',
    'python2-geoip: For displaying country codes'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linkchecker/linkchecker/archive/v$pkgver.tar.gz")
sha256sums=('1ce495fc5f2366ac5b31cbda6fef2c5cf6582bb2d55fd9648931952611e47473')

build() {
    cd "$pkgname-$pkgver"
    python2 setup.py build
}

# Upstream tests need to be fixed first
#check() {
#    cd "$pkgname-$pkgver" && python2 setup.py test
#}

package() {
    cd "$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir"
}
