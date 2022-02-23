# Maintainer: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.38.1
pkgrel=2
pkgdesc="CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM"
arch=("x86_64")
url="https://github.com/aws/aws-sam-cli"
license=("Apache")
optdepends=("docker")
source=("aws-sam-cli-linux-$pkgver-x86_64.zip::https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=("ce42d355437d69ee33e12a76747e53c8d383c4e7f505a986d498b2028c2c55b1")
provides=("aws-sam-cli")
conflicts=("aws-sam-cli")

package() {
  # install
  $srcdir/install -i "$pkgdir/usr/share/aws-sam-cli" -b "$pkgdir/usr/bin" >/dev/null

  # symlink the binary
  ln -sf "$pkgdir/usr/share/aws-sam-cli/$pkgver/dist/sam" "$pkgdir/usr/bin/sam"
}
