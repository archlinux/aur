# Maintainer: Denys Popov <besisland@besisland.name>
pkgname=rukbi
pkgver=3.5
pkgrel=2
pkgdesc="Alternative Ukrainian and Russian keyboard layouts with miscellaneous useful typographic characters, including Ilya Birman’s layout"
url="http://besisland.name/rukbi"
arch=("any")
license=("GPLv3")
depends=("xkeyboard-config" "python")
source=("http://rukbi.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('58741c7318f99d8157675c454eff213c')
sha1sums=('4195f1fd81535897a82f1f5a8aa2a851ccfe72a7')
sha256sums=('ddcd326976039c4b85424da09c01b5db89188321e9d86831716d077c566ea8b0')
install=arch-install

check() {
    cd "$srcdir"
    test/test
}

package() {
    local xkbdir="$pkgdir/usr/share/X11/xkb"
    cd "$srcdir"

    install -d $xkbdir/symbols $xkbdir/rules
    install -m 0644 symbols/* $xkbdir/symbols/

    install -d $xkbdir/rukbi/install $xkbdir/rukbi/symbols $xkbdir/rukbi/rules
    install -m 0755 install/* $xkbdir/rukbi/install/
    install -m 0644 symbols/* $xkbdir/rukbi/symbols/
    install -m 0644 rules/* $xkbdir/rukbi/rules/
}
