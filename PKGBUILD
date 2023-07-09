# Maintainer: ZeekoZhu <zeeko@zeeko.dev>
pkgname=imgur-cli-bin
pkgver='1.0.1'
pkgrel=1
pkgdesc="CLI for imgur, you can upload images to your account"
arch=('x86_64')
url="https://github.com/zeekozhu/projects"
license=('MIT')
depends=('dotnet-runtime-7.0')
source=("$pkgname-$pkgver-linux-x64.tar.gz::https://github.com/ZeekoZhu/projects/releases/download/imgur-cli%401.0.1/linux-x64.tar.gz")
sha256sums=('SKIP') # skip checksum for git source
options=("!strip")

prepare() {
  cd "$srcdir"
  mkdir -p "$pkgname-$pkgver"
  tar -xf "$pkgname-$pkgver-linux-x64.tar.gz" -C "$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "linux-x64/imgur-cli" "$pkgdir/usr/bin/imgur-cli"
  install -Dm644 "linux-x64/imgur-cli.fish" "$pkgdir/usr/share/fish/vendor_completions.d/imgur-cli.fish"
}

