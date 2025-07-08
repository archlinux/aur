# Maintainer: BilalWare <bilalware35@gmail.com>
pkgname=aesir-launcher
pkgver=3.0
pkgrel=1
pkgdesc="Aesir Minecraft Launcher"
arch=('x86_64')
url="https://github.com/AesirMC/Aesir-Launcher"
license=('GPL3')
depends=('java-runtime=21')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AesirMC/Aesir-Launcher/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Aesir-Launcher-$pkgver"
  mvn clean package
}

package() {
  cd "$srcdir/Aesir-Launcher-$pkgver"
  install -Dm755 run.sh "$pkgdir/usr/bin/aesir-launcher"
  install -Dm644 target/AesirLauncher-1.0-SNAPSHOT.jar "$pkgdir/usr/share/java/aesir-launcher/aesir-launcher.jar"
}
