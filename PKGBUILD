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
sha512sums=('8fdd3b6d8051272d0a179f9e3a71e32646528ae286cace00436b3d031003260bd9057bc294c81721b6186226511b04a9f2b72b410f57a44bc7ceabc8a5c7146d'
            '9d9c98e7bb43fb807826f2a51c969c98a05a1049df8537933d35f587a3a53df6b2ccaffb439f101f41e8b90f1ed96962d1b2fa9a093f16e95094fc9a48a73595')

prepare() {
	find . -type f -exec dos2unix {} \;
}

package() {
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/disunity/LICENSE.md"
  install -Dm755 launch.sh "$pkgdir/usr/bin/disunity"
  install -Dm644 disunity.jar "$pkgdir/usr/share/java/disunity/disunity.jar"
  find -name '*.jar' -exec install -Dm644 {} "$pkgdir/usr/share/java/disunity/"{} \;
}
