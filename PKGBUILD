# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=find-cursor
pkgver=1.4
pkgrel=7
pkgdesc="Simple XLib program to highlight the cursor position."
arch=('any')
url="https://github.com/arp242/find-cursor"
license=('MIT')
groups=(system)
depends=(xorg-xrefresh)
makedepends=(xz)
provides=('find-cursor')
conflicts=('find-cursor')
source=("https://github.com/arp242/find-cursor/archive/master.tar.gz")
md5sums=('80051fea879fdae88f57ec258ccbef79')

package() {
    cd "$srcdir/find-cursor-master"
    sed -i 's/\/local//g' Makefile
    make
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    make DESTDIR="$pkgdir" install
    cp LICENSE README.markdown "$pkgdir/usr/share/doc/$pkgname"
}
