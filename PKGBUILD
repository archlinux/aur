# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="quiqr-bin"
pkgver=0.17.14
pkgrel=1
pkgdesc="Offline CMS with a Hugo Engine"
url="https://quiqr.org/"
license=("GPL3")
arch=("x86_64")
provides=("quiqr")
conflicts=("quiqr")
depends=("gtk3"
         "libnotify"
         "libsecret"
         "libxss"
         "libxtst"
         "util-linux-libs"
         "xdg-utils")
source_x86_64=("https://github.com/quiqr/quiqr-desktop/releases/download/v$pkgver/quiqr_${pkgver}_linux_amd64.deb")
sha256sums_x86_64=('090c7b69ca196df0155143a7989fe206a58f535405eab9d5d8a9ddfcd5d0a068')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
 install -D -m 644  "$pkgdir/usr/share/icons/hicolor/0x0/apps/quiqr.png" "$pkgdir/usr/share/pixmaps/quiqr.png"
 rm -r "$pkgdir/usr/share/icons"
}
