# Maintainer: Ireozar <ireo at ireo dot dev>
pkgname="openspeedrun-bin"
pkgver=0.4.3
pkgrel=1
pkgdesc="Modern and minimalistic open-source speedrun timer"
arch=('x86_64')
url="https://github.com/SrWither/OpenSpeedRun"
license=('BSD-3')
depends=('wayland')
makedepends=('git')
provides=("openspeedrun")
conflicts=("openspeedrun")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/openspeedrun-linux-gnu-$arch.zip"
        "$pkgname-$pkgver::git+$url.git")
sha256sums=('7f50f68a79284939cf3340b840242d7f35a3147cb21a6929f8d9deca1828db6f'
            'SKIP')

package() {
  install -Dm755 openspeedrun openspeedrun-cli openspeedrun-cfg -t "$pkgdir/usr/bin"
  cd "$pkgname-$pkgver"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/openspeedrun"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/openspeedrun"
  cd "assets"
  install -Dm644 desktop/openspeedrun.desktop desktop/openspeedrun-cfg.desktop -t "$pkgdir/usr/share/applications"
  cd "icons"
  install -Dm644 256/OpenSpeedRun.png 256/OpenSpeedRun-CFG.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 512/OpenSpeedRun.png 512/OpenSpeedRun-CFG.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 1024/OpenSpeedRun.png 1024/OpenSpeedRun-CFG.png -t "$pkgdir/usr/share/icons/hicolor/1024x1024/apps"
}

