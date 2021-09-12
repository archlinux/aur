# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname=dictd
pkgname=$_pkgname-runit
pkgver=r1
pkgrel=1
pkgdesc="runit service scripts for $_pkgname"
url="https://aur.archlinux.org/packages/$pkgname"
arch=(any)
license=(GPL)
depends=(runit $_pkgname)
source=($_pkgname.run $_pkgname.finish)
sha256sums=('03e14ddf8a5bbe63625d96a8942ad166b467ae7b78672035964e7dc2bdbd9965'
            '22a2152e470acbeda7059141314d270d8e727719b8cf7c43e7265480add2187d')

package() {
    cd "$srcdir"
    install -Dm755 $_pkgname.run "$pkgdir/etc/runit/sv/$_pkgname/run"
    install -Dm755 $_pkgname.finish "$pkgdir/etc/runit/sv/$_pkgname/finish"
}
