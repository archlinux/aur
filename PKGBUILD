# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=monitor-git
pkgver=20140708
pkgrel=2
pkgdesc="Capture and share terminal commands with Monitor."
arch=("any")
url="https://github.com/dtannen/monitor"
license=('Creative Commons')
depends=('curl')
makedepends=('git' 'make')
provides=('monitor')
source=("$pkgname"::'git://github.com/dtannen/monitor.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 "monitor" "$pkgdir/usr/bin/monitor"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/monitor/LICENSE.txt"
}
