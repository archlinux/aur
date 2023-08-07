# Maintainer: nukeop <nuclear at gumblert dot tech>
# Contributor: neurognostic <neurognostic at protonmail dot com>

pkgname=nuclear-player-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.29
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
sha256sums=(ddff9a1baca43097bef6bf49a0e7b60acffc97d9ec287114a9501f2bc244cf6c
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