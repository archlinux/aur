# Maintainer: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.27.2
pkgrel=1
pkgdesc="CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM"
arch=("any")
url="https://github.com/aws/aws-sam-cli"
license=("Apache")
optdepends=("docker")
source=("https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=("de615d0c4eefca60a9d7d623388767eccde93ca8c44d7f7c65e236c171cdd477")
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
