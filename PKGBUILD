# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclist
pkgver=r2
pkgrel=2
pkgdesc='pacman hook to make lists of installed packages.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.hook config)
provides=($pkgname)
conflicts=($pkgname)

sha256sums=(
    b2423b71c85c00c5ffccf78dd8ed859edbbacac9f3765fa2ea6cb9662e9736a8
    69e6e0389bb29cd491306e8f2c611f59b0e6122007567e8b9f41d7bbda4aebcb
    5460135c15426c7845a8cb84a424c1501b12a9f6c4451600d03e1bce266acf45
)

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh -t "$pkgdir/usr/bin/"
    install -Dm644 config -t "$pkgdir/etc/$pkgname/"
    install -Dm644 $pkgname.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
