# Maintainer: Daniel Milenov <nullgaro@gmail.com>
# Contributor: Mario Sánchez <icutum@hotmail.com>
pkgname='ghfetch-git'
pkgver='1.2.5'
pkgrel=5
pkgdesc="A nice way to display CLI Github user / repo / organization info inspired in neofetch"
arch=('any')
url="https://github.com/ghfetch/ghfetch"
license=('MIT')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-requests' 'python-pillow' 'python-rich')
makedepends=('git')
source=('git+https://github.com/ghfetch/ghfetch.git')
md5sums=('SKIP')

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    install -Dm755 ./ghfetch/main.py "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ./README.md "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}