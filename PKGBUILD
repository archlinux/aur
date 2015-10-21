# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=style50
pkgver=2.1.4
pkgrel=1
pkgdesc="Style check tool for CS50 / CS50x (Harvard College's Introduction to Computer Science I)"
arch=('any')
url="https://manual.cs50.net/style/"
license=('CCPL')
source=("http://mirror.cs50.net/appliance50/2015/debs/dists/trusty/main/binary-i386/style50_2.1.4-1_i386.deb"
        "style50")
depends=('java-runtime')
md5sums=('cc705554b5a1a51951a19fa1696ed2e6'
         '1faa45e25def1e194cf8c1e365c03e73')

prepare() {
	ar p style50_"$pkgver"-"$pkgrel"_i386.deb data.tar.xz | unxz | tar -x -C "$srcdir"
}

package() {
	install -Dm755 "$srcdir"/style50 "$pkgdir"/usr/bin/style50
	install -Dm655 "$srcdir"/opt/style50/opt/style50.jar "$pkgdir"/opt/style50/style50.jar
}
