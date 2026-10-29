# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="quiqr-bin"
pkgver=0.22.7
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
source_x86_64=("https://github.com/quiqr/quiqr-desktop/releases/download/v$pkgver/quiqr_${pkgver}_amd64.deb")
b2sums_x86_64=('3b40aca421159eb29adf7f6b21c381ddafc548952cb30642e2ca93b1b69a503bc3b7d1e258a40f03d821988b8223b7077eb530c483f572ed5871c9023427cb8e')
options=("!strip")

prepare(){
 # compression of the data archive changes between releases
 tar -xf data.tar.*
}

package(){
 # since 0.22 the deb installs to /usr/lib/quiqr with the icon in pixmaps
 cp -r "usr" "$pkgdir"
 rm -r "$pkgdir/usr/share/lintian"
}
