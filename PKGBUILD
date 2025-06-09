# Maintainer: W. Turner Abney <wta at ieee dot org>
pkgname=webcamize
pkgver=2.0.1
pkgrel=1
pkgdesc="Use (almost) any camera as a webcam"
arch=('any')
url="https://github.com/cowtoolz/webcamize"
license=('BSD-2-Clause')
depends=('ffmpeg' 'libgphoto2' 'kmod' 'linux-headers' 'v4l2loopback-dkms')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  make
  install -Dm755 "./bin/webcamize" "$pkgdir/usr/bin/webcamize"
}
