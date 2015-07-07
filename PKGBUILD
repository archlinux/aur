# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="transmission-utils"
pkgver="0.0.2"
pkgrel="2"
pkgdesc="A set of command-line scripts that automate common tasks in Transmission"
arch=("any")
url="https://github.com/vinsonchuong/$pkgname"
license=("MIT")
depends=("transmission-cli")
makedepends=("clidoc")
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('b0fcc80a3e3a5bea08e88b532efe9dd7')
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
