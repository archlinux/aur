# Maintainer: lara@craft.net.br <lara@craft.net.br>
# Contributor: BlackICE <blackice@craft.net.br>

pkgname=simple-autostarter-git
pkgver=20141009.14.043ed17
pkgrel=1
pkgdesc="Simple manager for simple WM such openbox, fluxbox, etc"
arch=('any')
url="https://github.com/LaraCraft93/simple-autostarter"
license=('GPL')
depends=('python' 'python-gobject' 'gtk3')
makedepends=('git')
optdepends=('openbox: For openbox support' 'fluxbox: For fluxbox support' 'blackbox: For blackbox support')
source=("git+https://github.com/LaraCraft93/${pkgname%-*}")
sha1sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
    echo "$(date +%Y%m%d).$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
    cd "${pkgname%-*}"
    ./setup.py build
}

package() {
    cd "${pkgname%-*}"
    ./setup.py install --root "$pkgdir"
}
