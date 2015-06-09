# Maintainer: Your Name <youremail@domain.com>
pkgname=hotsuploader
pkgver=1.1.2
pkgrel=1
pkgdesc="Replay uploader for Heroes of the Storm"
arch=('any')
url="https://github.com/eivindveg/HotSUploader"
license=('apache')
depends=('jdk')
makedepends=('maven')
source=('https://github.com/eivindveg/HotSUploader/archive/1.1.2.tar.gz' 'hotsuploader')
sha256sums=('3f98bfc5552b8dc50508ece55f4e257dd1e16dd513e17ab1e6776fb5e83cedb2'
            '5e7f5a812f482b53771f63976603c694319eba9520e82f9e0797bc8b4db897b6')

build() {
  cd HotSUploader-"$pkgver"
  mvn clean package
}

package() {
  cd HotSUploader-"$pkgver"
  install -Dm644 target/*-jar-with-dependencies.jar "$pkgdir"/usr/lib/hotsuploader.jar
  install -Dm755 ../hotsuploader "$pkgdir"/usr/bin/hotsuploader
}
