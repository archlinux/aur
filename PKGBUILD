#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=fargate-cli
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI for AWS Fargate"
arch=('i686' 'x86_64')
source_i686=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_386")
source_x86_64=("https://github.com/turnerlabs/fargate/releases/download/v$pkgver/ncd_linux_amd64")
url="https://github.com/turnerlabs/fargate"
license=("MIT")
sha256sums_i686=("0827adcef50f8a560f2f04ee1963c7e3f833e1f86b940a5b5e723ce9639f2eff")
sha256sums_x86_64=("2aad22dac8e42d3debcf6103653fff18e087be0e44ac985f2044af2a97f6d95e")

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
