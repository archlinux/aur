# Maintainer: Yrz0 <yrz0@subride.de>
# Contributor: heinrich5991
pkgname=hotsuploader
pkgver=2.1.5
pkgrel=1
pkgdesc="Replay uploader for Heroes of the Storm"
arch=('any')
url="https://github.com/eivindveg/HotSUploader"
license=('apache')
depends=('bash' 'java-environment')
makedepends=('jdk8-openjdk' 'java-openjfx' 'maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eivindveg/HotSUploader/archive/v$pkgver.tar.gz" "hotsuploader")
noextract=("hotsuploader")
sha256sums=('72a6c3cae96d2c259099daa957a8cb6ff6e41bf9541941d4108389ec3ccf0e64'
            '5e7f5a812f482b53771f63976603c694319eba9520e82f9e0797bc8b4db897b6')

build() {
  cd HotSUploader-"$pkgver"
  mvn clean install
}

package() {
  cd HotSUploader-"$pkgver"
  install -Dm644 "target/HotS Replay Uploader-boot.jar" "$pkgdir"/usr/lib/hotsuploader.jar
  install -Dm755 ../hotsuploader "$pkgdir"/usr/bin/hotsuploader
}
