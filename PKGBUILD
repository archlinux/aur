# Maintainer: nukeop <nuclear at gumblert dot tech>
# Contributor: neurognostic <neurognostic at protonmail dot com>

pkgname=nuclear-player-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.28
pkgrel=3
pkgdesc='A free, multiplatform music player app that streams from multiple sources.'
arch=(x86_64)
url='http://nuclear.js.org'
provides=($_pkgname)
license=(GPL3)
depends=(libnotify libappindicator-gtk3 libxtst nss )
install=$pkgname.install
source=(
    https://github.com/nukeop/nuclear/releases/download/v$pkgver/nuclear-v$pkgver.deb
    https://raw.githubusercontent.com/nukeop/nuclear/v$pkgver/LICENSE
)
sha256sums=(aebc85b8ecda3278d66959bb26a17d3854e734b32ded3d190ab5e0177ea35fef
            SKIP)

prepare() {
    bsdtar -xJf data.tar.xz
}

package()   {
    install -dm0755 "$pkgdir/"{opt,usr}
    cp -art "$pkgdir" opt
    cp -art "$pkgdir" usr
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}