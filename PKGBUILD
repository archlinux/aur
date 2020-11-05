# Maintainer: Denys Popov <denys@denyspopov.biz>
pkgname=rukbi
pkgver=4.1
pkgrel=2
pkgdesc="Alternative keyboard layouts with miscellaneous useful typographic characters"
url="http://besisland.name/rukbi"
arch=("any")
license=("MIT")
depends=("xkeyboard-config" "python")
source=("https://github.com/denyspopov/rukbi/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.bz2")
md5sums=('6d549c632afcb78f0c84e8ed2ec4249b')
sha1sums=('487e9426d955525e9b4002b4ca09bde133e25097')
sha256sums=('fd10e88a18bd2463e81830451577b3aa07bebd90e455f3294f56cfaf95db23fe')
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
