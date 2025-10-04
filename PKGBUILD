# Maintainer: hurtki <email@example.com>
pkgname=configsmanager
pkgver=1.1.5
pkgrel=1
pkgdesc="CLI tool for managing configs"
arch=('x86_64' 'aarch64')
url="https://github.com/hurtki/configsManager"
license=('MIT')
# sources
source_x86_64=("${url}/releases/download/v${pkgver}/cm-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/cm-linux-arm64")
# x86_64 linux 
sha256sums_x86_64=('27b4177ccbeabaa945b3fe7b21778f2b8a3ed9ee2f4a1f369ecbf6d243b0e8cc')
# arm64 linux
sha256sums_aarch64=('3dc22711427f09dddfa917a010ce83c786d37b1e7831c55d43dd4cfa2f7aaaa5')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    install -Dm755 "$srcdir/cm-linux-amd64" "$pkgdir/usr/bin/cm"
  elif [ "$CARCH" == "aarch64" ]; then
    install -Dm755 "$srcdir/cm-linux-arm64" "$pkgdir/usr/bin/cm"
  fi
}

