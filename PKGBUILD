# Maintainer: prime-run <prime-run@github.com>

pkgname=wallrust-bin
_pkgname=wallrust
pkgver=1.0.1
pkgrel=1
pkgdesc="A blazingly fast and feature-rich tool to extract color palettes from images | written in Rust"
arch=('x86_64')
url="https://github.com/prime-run/wallrust"
license=('MIT')
depends=("imagemagick")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')


package() {
  cd "$srcdir"
  
  BINARY="wallrust"
  
  if [ ! -f "$BINARY" ]; then
    echo "Error: Could not find the binary '$BINARY'"
    find . -type f | sort
    exit 1
  fi
  
  install -Dm755 "$BINARY" "$pkgdir/usr/bin/$pkgname"
  
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  if [ -f "README.md" ]; then
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
