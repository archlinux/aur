# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
_pkgname=dictd
pkgname=$_pkgname-runit
pkgver=r3
pkgrel=1
pkgdesc="runit service scripts for $_pkgname"
url="https://aur.archlinux.org/packages/$pkgname"
arch=(any)
license=(GPL)
depends=(runit $_pkgname)
source=($_pkgname.run $_pkgname.finish)
sha256sums=('385133bb1030b109d85cd474be1e6a751e84ee2870813c19981f577779edaa2e'
            '22a2152e470acbeda7059141314d270d8e727719b8cf7c43e7265480add2187d')

package() {
    cd "$srcdir"
    install -Dm755 $_pkgname.run "$pkgdir/etc/runit/sv/$_pkgname/run"
    install -Dm755 $_pkgname.finish "$pkgdir/etc/runit/sv/$_pkgname/finish"
}
