# Maintainer: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.31.0
pkgrel=1
pkgdesc="CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM"
arch=("any")
url="https://github.com/aws/aws-sam-cli"
license=("Apache")
optdepends=("docker")
source=("https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=("458d961c27d0d6b61fa6857391a6698e5a9c47154c5f335c7c30d83d46a76d25")
provides=("aws-sam-cli")
conflicts=("aws-sam-cli")

package() {
  # install dist
  mkdir -p "$pkgdir/usr/local/share/aws-sam-cli/$pkgver"
  cp -r "$srcdir/dist" "$pkgdir/usr/local/share/aws-sam-cli/$pkgver"
  
  # symlink the binary
  mkdir -p "$pkgdir/usr/local/bin"
  ln -s "../share/aws-sam-cli/$pkgver/dist/sam" "$pkgdir/usr/local/bin/sam"
}
