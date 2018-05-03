#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=fargate-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="CLI for AWS Fargate"
arch=('any')
source_i686=("https://github.com/jpignata/fargate/releases/download/v$pkgver/fargate-$pkgver-linux-386.zip")
source_x86_64=("https://github.com/jpignata/fargate/releases/download/v$pkgver/fargate-$pkgver-linux-amd64.zip")
source_arm=("https://github.com/jpignata/fargate/releases/download/v$pkgver/fargate-$pkgver-linux-arm.zip")
url="https://github.com/jpignata/fargate"
license=("MIT")
makedepends=("unzip")
md5sums_i686=("dc8a6b6ef2ba5fb50a1d1f6765b7c049")
md5sums_x86_64=("d09e6bcdc836ce276368be56e387fcf4")
md5sums_arm=("5979a1d6c96fad358f3f52d4c3cbe687")

package() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "i686" ]; then
    _ARCH="386"
  elif [ "$CARCH" == "x86_64" ]; then
    _ARCH="amd64"
  else
    _ARCH="arm"
  fi

  # Unpack, flag as executable and move to the right directory
  cd "$srcdir"
  unzip "fargate-$pkgver-linux-$_ARCH.zip"
  chmod +x "fargate"
  install -Dm755 "fargate" "$pkgdir/usr/bin/fargate"
}
