pkgname=diffn
pkgver=0
pkgrel=1
pkgdesc="Efficient comparison of multiple large files"
arch=(i686 x86_64)
depends=()
license=('GPL3')
source=("http://volkerschatz.com/unix/scripts/diffn.tgz")
url="http://volkerschatz.com/unix/uware/diffn.html"
md5sums=("386b3e7d849f80006f1fabcf43c0ab09")

build() { 
    cd "$srcdir"/diffn
    gcc -o diffn diffn.c
}

package() {
    cd "$srcdir"/diffn
    install -d "$pkgdir"/usr/bin "$pkgdir"/usr/man/man1
    install -m 755 diffn "$pkgdir"/usr/bin
    install -m 644 diffn.1 "$pkgdir"/usr/man/man1
}

