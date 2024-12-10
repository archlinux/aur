# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="quiqr-bin"
pkgver=0.18.11
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
b2sums_x86_64=('978b69af8e0b25a9c324fe505b1d1f4770da98fad13adfb1727f9e3f63dfc98f90318617a295938218cd2a17b7d0ddaebc467d75bc01191571a9a0975154d8c8')
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
