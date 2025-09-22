# AUR Maintainer: shadichy <shadichy@blisslabs.org>
pkgname=ibus-lotus-git
pkgver=1.0.2+10+g277ff0c
pkgrel=1
pkgdesc='A maintained Vietnamese IME for IBus - fork of ibus-bamboo - unstable version'
arch=(any)
license=(GPL3)
url=https://github.com/LotusInputEngine/ibus-lotus
depends=('ibus')
optdepends=('kdotool: for switching modes on KDE Plasma')
makedepends=('go' 'libibus' 'libx11' 'gtk3' 'libxtst')
conflicts=('ibus-bamboo-git' 'ibus-bamboo' 'ibus-lotus' 'ibus-lotus-bin')
provides=('ibus-lotus')
options=('!strip')
source=("$pkgname"::git+$url)
md5sums=('SKIP')

pkgver() {
 cd "$pkgname"
 git describe --long --tags | sed 's#v##;s#-RC#.rc#;s#-#+#g'
}

build() {
 cd "$pkgname"
 make build
}

package() {
 cd "$pkgname"
 make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
