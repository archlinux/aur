# Maintainer: Matty Glancy <ukmatty73 (at) gmail (com)>

pkgname=fsmsg-git
pkgver=1.0.3
pkgrel=1
pkgdesc="Leave messages to other users on the system"
arch=('any')
url="https://github.com/MatthewGlancy/fsmsg.git"
license=('0BSD')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')
install=fsmsg.install

package() {
    cd "$pkgname"
    install -Dm755 ./fsmsg "$pkgdir/usr/bin/fsmsg"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 ./fsmsg.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/fsmsg.conf"
}