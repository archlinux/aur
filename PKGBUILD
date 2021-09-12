# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname=windscribe
pkgname=$_pkgname-runit
pkgver=r1
pkgrel=1
pkgdesc="runit service scripts for $_pkgname"
url="https://aur.archlinux.org/packages/$pkgname"
arch=(any)
license=(GPL)
depends=(runit $_pkgname-cli)
source=($_pkgname.run $_pkgname.finish)
sha256sums=('b6ac48f46440f0426f3c2b9275bfad9869211637c58b3ce3f7a2cf44d3cce59d'
            'c6a27438d58724f74ceddfb41feec50822c72f16d8216a68b121bae706d5d9a3')

package() {
    cd "$srcdir"
    install -Dm755 ${source[@]} -t "$pkgdir/etc/runit/sv/$_pkgname/run"
}
