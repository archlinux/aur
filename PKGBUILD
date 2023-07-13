# Maintainer: Daniel Milenov <icutum@gmail.com>
# Contributor: Mario Sánchez <nullgaro@gmail.com>
pkgname='ghfetch'
pkgver='1.2.5'
pkgrel=3
epoch=3
pkgdesc="A nice way to display CLI Github user / repo / organization info inspired in neofetch"
arch=('x86_64')
url="https://github.com/ghfetch/ghfetch"
license=('MIT')
depends=('python>=3.6.0' 'python-pip' 'python-setuptools>=68.0.0' 'python-aiohttp>=3.8.4' 'python-requests>=2.28.2'  'python-pillow>=10.0.0' 'python-rich>=12.5.1')
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