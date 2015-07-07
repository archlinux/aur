# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="gitetc"
pkgver="0.0.1"
pkgrel="2"
pkgdesc="Scripts to help you track changes to your /etc files"
arch=("any")
url="https://github.com/vinsonchuong/$pkgname"
license=("MIT")
depends=("git")
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('91660b0b8aca24640c8b3494cfbf056e')
build () 
{ 
    cd "$srcdir/$pkgname-$pkgver";
    [ -d 'doc' ] && clidoc doc/*.md
}
package () 
{ 
    cd "$srcdir/$pkgname-$pkgver";
    [ -d 'bin' ] && install -Dm755 -t "$pkgdir/usr/bin" bin/*;
    [ -d 'help' ] && install -Dm644 -t "$pkgdir/usr/share/$pkgname/help" help/*;
    [ -f 'README.md' ] && install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" 'README.md';
    [ -d 'doc' ] && install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/doc" doc/*.md;
    [ -f 'LICENSE' ] && install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" 'LICENSE';
    [ -d 'man' ] && install -Dm644 -t "$pkgdir/usr/share/man/man1" man/*
}
