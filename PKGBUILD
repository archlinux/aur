#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=fargate-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI for AWS Fargate"
arch=('i686' 'x86_64')
source_i686=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_386")
source_x86_64=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_amd64")
url="https://github.com/turnerlabs/fargate"
license=("MIT")
sha256sums_i686=("e6c70c7bf4081a0b0a09b410c313edbd18886a7849d982c10991a91af9a5afd3")
sha256sums_x86_64=("a80e220e55251731209e1a6029c1e4d7c8cc242d12a2a4054b1eb88bbe1fadc2")

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
