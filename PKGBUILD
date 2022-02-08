# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
pkgname=paclist
pkgver=r4
pkgrel=2
pkgdesc='pacman hook to make lists of installed packages.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.hook config)

sha256sums=('b2423b71c85c00c5ffccf78dd8ed859edbbacac9f3765fa2ea6cb9662e9736a8'
            'd63dced7184b8688bcc5e414352d0e436a10f4b5dba1243644f68e7ff277228e'
            'd29a5dd3b799e60312d94819d78ff025e55d72918cd47dd0e5be2b1edbf73d66')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh -t "$pkgdir/usr/bin/"
    install -Dm644 config -t "$pkgdir/etc/$pkgname/"
    install -Dm644 $pkgname.hook -t "$pkgdir/usr/share/libalpm/hooks/"
}
