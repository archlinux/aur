# Maintainer: Serhan Aydinicen <saydinicen9@gmail.com>

pkgname=crewbeacon
_id=com.conqrex.crewbeacon
pkgver=0.1.2
pkgrel=1
pkgdesc='KDE Plasma 6 cockpit for AI quota, Paseo agents, attention, and usage'
arch=('any')
url='https://github.com/Conqrex/Conqrex.CrewBeacon'
license=('MIT')
depends=('plasma-workspace' 'qt6-websockets' 'python' 'curl' 'jq' 'xdg-utils')
optdepends=('konsole: open agent sessions in a terminal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ccd2601eeb1bc78a339965773ec2b52870975f6312476224f646420369f34651')

package() {
    install -dm755 "$pkgdir/usr/share/plasma/plasmoids/$_id"
    cp -a "$srcdir"/*/package/. "$pkgdir/usr/share/plasma/plasmoids/$_id/"
    install -Dm644 "$srcdir"/*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir"/*/package/contents/icons/crewbeacon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/crewbeacon.svg"
}
