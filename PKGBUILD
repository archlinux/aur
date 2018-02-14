# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Alexej Magura <agm2819*gmail*>

pkgname=freebsd-manpages
pkgver=11.1
_bsdrel=3
pkgrel=1
pkgdesc="Manual pages for GNU/kFreeBSD systems"
arch=('any')
url="http://packages.debian.org/sid/freebsd-manpages"
license=('BSD')
makedepends=('tar')
source=("http://mirrors.kernel.org/debian/pool/main/f/$pkgname/${pkgname}_${pkgver}-${_bsdrel}_all.deb")
md5sums=('84085cbfcb4f24bd37e5a31b12474e68')


prepare () {

    tar xJf data.tar.xz 

}

package () {

    cd "$srcdir"

    install -d "$pkgdir"/usr/share{/man{/man2,/man3,/man4,/man9},/licenses/$pkgname}

    for files in $(ls -1 $srcdir/usr/share/man/man2)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man2 usr/share/man/man2/$files
    done 

    for files in $(ls -1 $srcdir/usr/share/man/man3)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man3 usr/share/man/man3/$files
    done

    for files in $(ls -1 $srcdir/usr/share/man/man4)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man4 usr/share/man/man4/$files
    done

    for files in $(ls -1 $srcdir/usr/share/man/man9)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man9 usr/share/man/man9/$files
    done

    install -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname usr/share/doc/$pkgname/copyright

}
