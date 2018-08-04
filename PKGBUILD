#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=fargate-cli
pkgver=0.3.2
pkgrel=1
pkgdesc="CLI for AWS Fargate"
arch=('i686' 'x86_64')
# https://github.com/turnerlabs/fargate/releases/download/v0.3.0/ncd_linux_386
source_i686=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_386")
# https://github.com/turnerlabs/fargate/releases/download/v0.3.0/ncd_linux_amd64
source_x86_64=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_amd64")
url="https://github.com/turnerlabs/fargate"
license=("MIT")
md5sums_i686=("37a64acfa65abbbd5995a04128966436")
md5sums_x86_64=("8d91b0cff617ea23efe7ce8c4f311129")

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
