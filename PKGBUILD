# Maintainer: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.40.0
pkgrel=1
pkgdesc="CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM"
arch=("x86_64")
url="https://github.com/aws/aws-sam-cli"
license=("Apache")
optdepends=("docker")
source=("aws-sam-cli-linux-$pkgver-x86_64.zip::https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=("1e12942d8916e905141147b653d1286ee4730d22fc498f312965a6718967b22c")
provides=("aws-sam-cli")
conflicts=("aws-sam-cli")

package() {
  # install
  $srcdir/install -i "$pkgdir/usr/share/aws-sam-cli" -b "$pkgdir/usr/bin" >/dev/null

  # symlink the binary
  ln -sf "/usr/share/aws-sam-cli/$pkgver/dist/sam" "$pkgdir/usr/bin/sam"
}
