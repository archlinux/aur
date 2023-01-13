# Maintainer: Tobias Leupold <tl at stonemx dot de>
pkgname=ifstatus
pkgver=2.0.0
pkgrel=1
url="https://ifstatus.sourceforge.io/"
pkgdesc="A simple CLI program for displaying network statistics in real time"
arch=( "x86_64" )
license=( "GPL2" )
depends=( "ncurses" )
source=( "http://ifstatus.sourceforge.net/download/ifstatus-v2.0.0.tar.gz" )
sha256sums=( "7b4a6124b02e41b4fe532a634bbc66e5749145d1963455190c20f5518513c258" )

build()
{
    cd "$pkgname-v$pkgver"
    make
}

package()
{
    install -Dm755 "$srcdir/$pkgname-v$pkgver/ifstatus" "$pkgdir/usr/bin/ifstatus"
    install -Dm644 "$srcdir/$pkgname-v$pkgver/README" \
                   "$pkgdir/usr/share/doc/$pkgname-$pkgver/README"
    install -Dm644 "$srcdir/$pkgname-v$pkgver/AUTHORS" \
                   "$pkgdir/usr/share/doc/$pkgname-$pkgver/AUTHORS"
}
