# Maintainer: Ingo Bürk <admin at airblader dot de>
_pkgname=yolo
pkgname=${_pkgname}-git
pkgver=latest
pkgrel=1
pkgdesc='kills a random pid'
arch=('i686' 'x86_64')
url="https://github.com/Airblader/yolo"
license=('MIT')
depends=()
makedepends=('git')
provides=('yolo' 'yolo-forkbomb')
conflicts=()
source=("$_pkgname::git+http://github.com/Airblader/yolo")
md5sums=('SKIP')

build() {
    cd "$_pkgname"
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
