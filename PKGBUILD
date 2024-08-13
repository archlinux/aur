# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma6-applets-resources-monitor
_name=plasma-applet-resources-monitor
pkgver=3.0.1
pkgrel=1
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
b2sums=('7f3bb17478270d844be45b2f848c73c0417c08d37ffd0667a054b18b21184eb90b822774dfe9f92c9c72c3a0c34862a9238d65581e2c37456a819f1e7c9d69d7')

# TODO: change to cmake when upstream porting to Plasma 6
package() {
    cd $_name-$pkgver
    mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/org.kde.plasma.resources-monitor/
    cp -r package/* "$pkgdir"/usr/share/plasma/plasmoids/org.kde.plasma.resources-monitor/
}
