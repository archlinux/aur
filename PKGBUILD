# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=crewbeacon
_id=com.conqrex.crewbeacon
pkgver=0.1.3
pkgrel=1
pkgdesc='KDE Plasma 6 cockpit for AI quota, Paseo agents, attention, and usage'
arch=('any')
url='https://github.com/Conqrex/Conqrex.CrewBeacon'
license=('MIT')
depends=('plasma-workspace' 'qt6-websockets' 'python' 'curl' 'jq' 'xdg-utils')
optdepends=('konsole: open agent sessions in a terminal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3bc295298840624f68592749d8b1b75bbe8acf7347565cb82bbe961f81ba647')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir"/*/package/contents/icons/crewbeacon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/crewbeacon.svg"
}
