# Maintainer: Denys Popov <denys@denyspopov.biz>
pkgname=rukbi
pkgver=4.0
pkgrel=1
pkgdesc="Alternative keyboard layouts with miscellaneous useful typographic characters"
url="http://besisland.name/rukbi"
arch=("any")
license=("GPL3")
depends=("xkeyboard-config" "python")
source=("https://bitbucket.org/denyspopov/rukbi/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('0aa98a3726bccc85068c23694a0bddc4')
sha1sums=('23a3cd199f33c90f050f219f86fd2a016b6b77bd')
sha256sums=('0408284d758691d0dd87f42ec7fd69f01e53dfc73483a570260633131a6e7743')
install=arch-install

package() {
    local xkbdir="$pkgdir/usr/share/X11/xkb"
    cd "$srcdir"

    install -d $xkbdir/symbols
    install -m 0644 symbols/* $xkbdir/symbols/

    install -d $xkbdir/rukbi/install $xkbdir/rukbi/symbols $xkbdir/rukbi/rules
    install -m 0755 install/* $xkbdir/rukbi/install/
    install -m 0644 symbols/* $xkbdir/rukbi/symbols/
    install -m 0644 rules/* $xkbdir/rukbi/rules/
}
