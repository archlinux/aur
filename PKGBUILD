# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
_pkgname=windscribe
pkgname=$_pkgname-runit
pkgver=r3
pkgrel=2
pkgdesc="runit service scripts for $_pkgname"
url=https://aur.archlinux.org/packages/$pkgname
arch=(any)
license=(GPL)
depends=(runit $_pkgname-cli)
source=($_pkgname.run $_pkgname.finish)
sha256sums=('f719b57b18fb2fda60920a5394f8532070fa70db555456c0dc7ae21371fd0cb0'
            'c6a27438d58724f74ceddfb41feec50822c72f16d8216a68b121bae706d5d9a3')

package() {
    cd "$srcdir"
    install -Dm755 $_pkgname.run "$pkgdir/etc/runit/sv/$_pkgname/run"
    install -Dm755 $_pkgname.finish "$pkgdir/etc/runit/sv/$_pkgname/finish"
}
