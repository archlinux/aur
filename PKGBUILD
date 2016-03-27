# Maintainer: Your Name <youremail@domain.com>
pkgname=hotsuploader
pkgver=2.0.3
pkgrel=1
pkgdesc="Replay uploader for Heroes of the Storm"
arch=('any')
url="https://github.com/eivindveg/HotSUploader"
license=('apache')
depends=('jdk')
makedepends=('maven')
source=("https://github.com/eivindveg/HotSUploader/archive/v$pkgver.tar.gz" 'hotsuploader')
sha256sums=('7598d1adf66580c29f8419a9bb8670e7807075d3953ed33fd86d34e3b3713812'
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
