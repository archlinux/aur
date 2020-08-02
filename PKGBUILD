# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Alexej Magura <agm2819*gmail*>

pkgname=freebsd-manpages
pkgver=12.0
_bsdrel=1
pkgrel=1
pkgdesc="Manual pages for GNU/kFreeBSD systems"
arch=('any')
url="http://packages.debian.org/sid/freebsd-manpages"
license=('BSD')
makedepends=('tar')
source=("http://mirrors.kernel.org/debian/pool/main/f/$pkgname/${pkgname}_${pkgver}-${_bsdrel}_all.deb")
md5sums=('215d533dd5758c5e0cdfd9f3ea4c3094')

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
