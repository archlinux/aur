# Maintainer: Redson dos Santos Silva <redsonbr81{at}yandex{dot}com>
_pkgname=ly
pkgname=$_pkgname-runit
pkgver=r3
pkgrel=1
pkgdesc="runit service scripts for $_pkgname"
url="https://aur.archlinux.org/packages/$pkgname"
arch=(any)
license=(GPL)
depends=(runit $_pkgname)
source=($_pkgname.run $_pkgname.finish)
sha256sums=('4b7a1223808a30295a4b09a875dfc7dd1381316f6652f2e043609724f9c6329b'
            'd3f8534ffd8c01e27e5d91a807c3017e3d94ae0b05d56a53b0741739943e7983')

package() {
    cd "$srcdir"
    install -Dm755 $_pkgname.run "$pkgdir/etc/runit/sv/$_pkgname/run"
    install -Dm755 $_pkgname.finish "$pkgdir/etc/runit/sv/$_pkgname/finish"
}

