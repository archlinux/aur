#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=fargate-cli
pkgver=0.14.0
pkgrel=1
pkgdesc="CLI for AWS Fargate"
arch=('i686' 'x86_64')
source_i686=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_386")
source_x86_64=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_amd64")
url="https://github.com/turnerlabs/fargate"
license=("MIT")
sha256sums_i686=('15113cdc44b38300ab98977ac916684722b41473e21c9564bd964cc37166b484')
sha256sums_x86_64=('3aa80ee0ebf520a3d3420c748b2550ab417561fa0c125e2fa686e304e6cc8484')

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
