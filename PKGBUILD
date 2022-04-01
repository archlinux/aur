# Maintainer: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.43.0
pkgrel=1
pkgdesc="CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM"
arch=("x86_64")
url="https://github.com/aws/aws-sam-cli"
license=("Apache")
optdepends=("docker")
source=("aws-sam-cli-linux-$pkgver-x86_64.zip::https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=("5475e78ce0a27379a5cd69bbc868e0350bad4f74b2abfc1ddf1b9cfcfc9f40a8")
provides=("aws-sam-cli")
conflicts=("aws-sam-cli")

package() {
  # install
  $srcdir/install -i "$pkgdir/usr/share/aws-sam-cli" -b "$pkgdir/usr/bin" >/dev/null

  # symlink the binary
  ln -sf "/usr/share/aws-sam-cli/$pkgver/dist/sam" "$pkgdir/usr/bin/sam"
}
