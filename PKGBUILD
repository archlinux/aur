# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclist
pkgver=r1
pkgrel=1
pkgdesc='pacman hook to make lists of installed packages.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.conf $pkgname.hook)
provides=($pkgname)
conflicts=($pkgname)

sha256sums=(
    797cf54f8bf1f2bd471b00dcfbe568c60d1c637783655ffc75b93034b64502a9
    5460135c15426c7845a8cb84a424c1501b12a9f6c4451600d03e1bce266acf45
    59d60913b1c473eb4b9d13b833e76d8d4867f200c6a5cb42de8721e06aa44cbb
)

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.conf -t "$pkgdir/etc/$pkgname/"
    install -Dm644 $pkgname.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
