# Maintainer: FireZ <firez199984@gmail.com>

_pkgname=surface-pro-3-scripts
pkgname=surfacepro3-autorotate
pkgver=r21.bdd6abe
pkgrel=1
pkgdesc="Assists Surface Pro 3 tablets autorotate based on device orentation"
arch=('i686' 'x86_64')
url="https://github.com/simonwjackson/surface-pro-3-scripts"
depends=('python2')
source=("git://github.com/simonwjackson/surface-pro-3-scripts.git"
        "autorotate")
md5sums=('SKIP'
         'ab0ebbf9c05b851d8072e2c3efa727f7')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 autorotate "$pkgdir/usr/bin/autorotate"

    cd $_pkgname    
    install -Dm755 autorotate.py "$pkgdir/usr/share/$pkgname/autorotate.py"
    install -Dm644 status.txt "$pkgdir/usr/share/$pkgname/status.txt"
    install -Dm644 touch.txt "$pkgdir/usr/share/$pkgname/touch.txt"
}
