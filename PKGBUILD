# Maintainer: prime-run <prime-run@github.com>

pkgname=hyde-ipc
_pkgname=hyde-ipc
pkgver=0.1.1
pkgrel=2
pkgdesc="Control Hyprland, query its state, listen for events, and create automated reactions to events."
arch=('x86_64')
url="https://github.com/HyDE-Project/hyde-ipc"
license=('MIT')
depends=(hyprland)

source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  BINARY="hyde-ipc"

  if [ ! -f "$BINARY" ]; then
    echo "Error: Could not find the binary '$BINARY'"
    find . -type f | sort
    exit 1
  fi

  install -Dm755 "$BINARY" "$pkgdir/usr/bin/$_pkgname"

}
