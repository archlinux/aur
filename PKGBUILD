# Maintainer: Andr0med4
# Contributor: Garrett <floft.net/contact>

pkgname=worldwind
pkgver=2.2.1
pkgrel=1
pkgdesc="Open source 3D interactive world viewer"
arch=("x86_64")
url="http://worldwind.arc.nasa.gov/java/"
license=("Apache License 2.0")
depends=("java-runtime>=11")
source=("https://github.com/NASAWorldWind/WorldWindJava/releases/download/v${pkgver}/worldwind-v${pkgver}.zip"
        "worldwind")
sha512sums=("b9836779c11e464f7ee19a08e9d5366d0a39d368143831f8e4cbec38d7ead8efa318f58f6b3c74721e211ca9d34b1653c1510b9d1fa706ced97825002ee551ea"
            "6cb0eb5b2c1e901f27572ea9e4c654a0c031bc7ac5d48d58d8d24baaacc9f71e686f7dec4e7a07a923f79f36da51e962bb507df1727c6cdf62996d4864d6be44")

package() {
  # Copy worldwind files to destination folder
  mkdir -p  "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir"/* "$pkgdir/usr/share/$pkgname/"

  # Create launch script
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir"/worldwind "$pkgdir/usr/bin/"
  chmod +x "$pkgdir/usr/bin/worldwind"
}
