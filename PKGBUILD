# Maintainer: HanHaocheng <1849397656@qq.com>

pkgname=plasma6-applets-kde-control-station
pkgver=2.8.0
pkgrel=2
pkgdesc="A beautiful and modern configuration center for KDE Plasma inspired by macOS"
arch=(any)
url='https://github.com/EliverLara/kde-control-station'
license=(GPL-3.0-only)
depends=(bluedevil kdeconnect kdeplasma-addons plasma-nm plasma-pa plasma-workspace plasma5support powerdevil)
makedepends=(git)
source=(
  "https://github.com/EliverLara/kde-control-station/archive/bb473188a19d6cbe89a9c1bb5b08c7ddc609375d.tar.gz"
  "kde-control-station-fixes.patch"
)
sha256sums=(
  'b2d3c32aab490d8e0efedba4b0c4c906d7dbd0ce56d483861550879a8f0db898'
  'e7a99c9818b354121da50670da3b06f1ce8d4617ae6f358295bc2149f0d3795a'
)

prepare() {
  cd "${srcdir}/kde-control-station-bb473188a19d6cbe89a9c1bb5b08c7ddc609375d"
  patch -Np1 < "${srcdir}/kde-control-station-fixes.patch"
}

package() {
  cd "${srcdir}/kde-control-station-bb473188a19d6cbe89a9c1bb5b08c7ddc609375d"
  local dest="$pkgdir/usr/share/plasma/plasmoids/KdeControlStation"
  install -d "$dest"
  cp -r package/. "$dest/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}
