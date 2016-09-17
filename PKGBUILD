#Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=disunity
pkgver=0.5.0
pkgrel=1
pkgdesc="An experimental toolset for Unity asset and asset bundle files."
arch=("any")
url="https://github.com/ata4/disunity"
license=("public domain")
makedepends=(dos2unix)
depends=(java-runtime)
source=("https://github.com/ata4/disunity/releases/download/v$pkgver/disunity_v$pkgver.zip" "launch.sh")
sha256sums=('1915de291f1f6583e917d837416ac00a44e99bde4633898aecb9093a30c5bdac'
            '13c51e9ca5ef00f24fd8d4133a5a81d2318b22cb4cfc79e6899d5494e00b0ffb')

prepare() {
	find . -type f -exec dos2unix {} \;
}

package() {
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/disunity/LICENSE.md"
  install -Dm755 launch.sh "$pkgdir/usr/bin/disunity"
  install -Dm644 disunity.jar "$pkgdir/usr/share/java/disunity/disunity.jar"
  find -name '*.jar' -exec install -Dm644 {} "$pkgdir/usr/share/java/disunity/"{} \;
}
