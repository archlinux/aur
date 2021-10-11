# Maintainer: Ehsan Ghorbannezad <ehsangn at protonmail dot ch>

_gist_id=113f4559a4ac8ccb0225a89b9c74c0ea
pkgname=windowtweaks
pkgver=r4
pkgrel=1
pkgdesc="Simple tool to tweak X windows' decorations, input hints, etc."
url=https://gist.github.com/AquariusPower/$_gist_id
arch=(x86_64)
license=(GPL)
depends=(libx11)
makedepends=(pkgconf)
provides=($pkgname)
conflicts=($pkgname)
source=("https://gist.githubusercontent.com/AquariusPower/$_gist_id/raw/0d89da448b8c5da392c6040c6516aa9cd432b98a/$pkgname.c")
sha256sums=('d8b8623880bdc794458486e1492966b302804f475e3434c5723f7568a3808404')

build() {
    c++ $(pkg-config --cflags --libs x11) -Wall $pkgname.c -o $pkgname
}

package() {
    install -D $pkgname "$pkgdir/usr/bin/$pkgname"
}
