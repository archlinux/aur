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
#depends=('')
makedepends=('tar')
source=("http://mirrors.kernel.org/debian/pool/main/f/$pkgname/${pkgname}_${pkgver}-${_bsdrel}_all.deb")
md5sums=('84085cbfcb4f24bd37e5a31b12474e68')

prepare () {
    tar xf data.tar.xz 
}

package () {
    cd "$srcdir"
    install -d "$pkgdir"/usr/share/{man/{man2,man3,man4,man9},licenses/"$pkgname"}
    install -m644 usr/share/doc/$pkgname/copyright "$pkgdir"/usr/share/licenses/"$pkgname"/
    for i in 2 3 4 9; do
      install -m644 -t "$pkgdir"/usr/share/man/man$i usr/share/man/man$i/*
    done
}
