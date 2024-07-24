# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-resources-monitor
_name=plasma-applet-resources-monitor
pkgver=3.0.0
pkgrel=3
pkgdesc='Plasmoid for monitoring CPU, memory, network traffic, GPUs and disks IO'
arch=(any)
url=https://github.com/orblazer/plasma-applet-resources-monitor
license=(GPL-3.0-or-later)
depends=(
    kitemmodels
    kquickcharts
    libksysguard
    libplasma
    plasma5support
)
optdepends=(
    "kdeplasma-addons: to support easier click action"
)
conflicts=(
    plasma5-applets-resources-monitor
    plasma5-applets-resources-monitor-git
    plasma6-applets-resources-monitor-git
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('df789155a226c189421667e228e2e1add1af79243d425ddacc75ed03ea36ac30cde8fb6e72575cd5705f80520e2beee6d4223f4c7c5c2cc804e9d3bcb07b807d')

# TODO: change to cmake when upstream porting to Plasma 6
package() {
    cd $_name-$pkgver
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/org.kde.plasma.resources-monitor/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/org.kde.plasma.resources-monitor/
}
