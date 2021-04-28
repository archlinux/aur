# Maintainer: Andr0med4
# Contributor: Garrett <floft.net/contact>

pkgname=worldwind
pkgver=2.2.0
pkgrel=1
pkgdesc="Open source 3D interactive world viewer"
arch=("x86_64")
url="http://worldwind.arc.nasa.gov/java/"
license=("Apache License 2.0")
depends=("java-runtime>=11")
source=("https://github.com/NASAWorldWind/WorldWindJava/releases/download/v${pkgver}/worldwind-v${pkgver}.zip"
        "worldwind")
sha512sums=("0493fe8c465036a8e487f38513483cd816ffe2f1ba2ebdca35ae71e98b752be0c207e51e1151d71abd2a2ef7397fea2dcd4709373524a2d7a0149a7f2ad5aab4"
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
