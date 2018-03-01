# Maintainer: Yrz0 <yrz0@subride.de>
# Contributor: heinrich5991
pkgname=hotsuploader
pkgver=2.1.5
pkgrel=2
pkgdesc="Replay uploader for Heroes of the Storm"
arch=('any')
url="https://github.com/eivindveg/HotSUploader"
license=('apache')
depends=('java-environment')
makedepends=('jdk8-openjdk' 'java-openjfx' 'maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eivindveg/HotSUploader/archive/v$pkgver.tar.gz"
        "hotsuploader.sh")
sha256sums=('72a6c3cae96d2c259099daa957a8cb6ff6e41bf9541941d4108389ec3ccf0e64'
            '416e6d5596562fc2e0bd2ab32f94b78fa8bc50ae7fdb2ffba021cf3f61c44389')

build() {
  cd HotSUploader-"$pkgver"
  mvn clean install
}

package() {
  cd HotSUploader-"$pkgver"
  install -Dm644 "target/HotS Replay Uploader-boot.jar" "$pkgdir"/usr/share/java/hotsuploader/hotsuploader.jar
  install -Dm755 "$srcdir"/hotsuploader.sh "$pkgdir"/usr/bin/hotsuploader
}
