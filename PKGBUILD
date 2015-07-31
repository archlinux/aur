# Maintainer: Vinson Chuong <vinsonchuong@gmail.com>
pkgname="bash-common-parse-options"
pkgver="0.0.2"
pkgrel="1"
pkgdesc="An easier way to parse CLI options for Bash scripts"
arch=("any")
url="https://github.com/vinsonchuong/$pkgname"
license=("MIT")
makedepends=("clidoc")
checkdepends=("bats-git")
source=("$url/archive/v$pkgver-1.tar.gz")
md5sums=('0cfd4148dbe7eec0090baa227d8b3b2b')
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
