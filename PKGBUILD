# Maintainer: Daniel Milenov <icutum@gmail.com>
# Contributor: Mario Sánchez <nullgaro@gmail.com>
pkgname='ghfetch'
pkgver='1.2.5'
pkgrel=1
pkgdesc="A nice way to display CLI Github user / repo / organization info inspired in neofetch"
arch=('x86_64')
url="https://github.com/ghfetch/ghfetch"
license=('MIT')
depends=('python' 'python-pip' 'python-aiohttp' 'python-requests'  'python-pillow' 'python-rich')
makedepends=('git')
source=('ghfetch::https://github.com/ghfetch/ghfetch.git')
md5sums=('SKIP')

build() {
    cd "../../$pkgname"
    python setup.py build
}

package() {
    cd "../../$pkgname"
    install -Dm755 ./ghfetch/main.py "$pkgdir/usr/bin/ghfetch"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}