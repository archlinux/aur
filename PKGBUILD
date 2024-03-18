# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ttk-themes-breeze-git"
pkgver=r20.cb7dd7f
pkgrel=1
pkgdesc="Tk version of Breeze and Breeze Dark themes"
url="https://github.com/thindil/tkBreeze"
arch=("any")
license=("custom:none")
depends=("tcl" "tk")
optdepends=("ttk-theme-chooser")
conflicts=("ttk-themes" "ttk-themes-breeze")
replaces=("ttk-themes-breeze")
source=("git+$url")
b2sums=("SKIP")
install="ttk-themes-breeze.install"

pkgver(){
 cd "tkBreeze"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
 cd "tkBreeze"
 mkdir -p "$pkgdir/usr/lib/ttkthemes"
 cp -r "breeze"* "$pkgdir/usr/lib/ttkthemes/"
 install -D -m 664 "pkgIndex.tcl" -t "$pkgdir/usr/lib/ttkthemes"
}
