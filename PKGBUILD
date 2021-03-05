#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=fargate-cli
pkgver=0.9.0
pkgrel=1
pkgdesc="CLI for AWS Fargate"
arch=('i686' 'x86_64')
source_i686=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_386")
source_x86_64=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_amd64")
url="https://github.com/turnerlabs/fargate"
license=("MIT")
sha256sums_i686=("ad88dc691d8b155e46cd3e99947a3add848c9c922694735a6d42323f973ad88a")
sha256sums_x86_64=("c0932a047beabc6b83931fe726e8a9ac2ce5693254d22da7814e5e78f7ae0ffd")

package() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "i686" ]; then
    _ARCH="386"
  elif [ "$CARCH" == "x86_64" ]; then
    _ARCH="amd64"
  fi

  # Unpack, flag as executable and move to the right directory
  install -Dm755 "ncd_linux_${_ARCH}" "$pkgdir/usr/bin/fargate"
}
