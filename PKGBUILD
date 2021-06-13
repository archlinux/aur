# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=paclist
pkgver=r3
pkgrel=2
pkgdesc='pacman hook to make lists of installed packages.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.hook config)
provides=($pkgname)
conflicts=($pkgname)

sha256sums=('b2423b71c85c00c5ffccf78dd8ed859edbbacac9f3765fa2ea6cb9662e9736a8'
            '69e6e0389bb29cd491306e8f2c611f59b0e6122007567e8b9f41d7bbda4aebcb'
            'd29a5dd3b799e60312d94819d78ff025e55d72918cd47dd0e5be2b1edbf73d66')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh -t "$pkgdir/usr/bin/"
    install -Dm644 config -t "$pkgdir/etc/$pkgname/"
    install -Dm644 $pkgname.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
