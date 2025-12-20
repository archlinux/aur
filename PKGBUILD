pkgname=vopk
pkgver=0
pkgrel=1
pkgdesc="VOPK — unified cross-distro package frontend"
arch=('any')
url="https://github.com/gpteamofficial/vopk"
license=('GPL-3.0-only')
depends=('bash')

source=("vopk::https://raw.githubusercontent.com/gpteamofficial/vopk/main/bin/vopk")
sha256sums=('106659b7de80068c9be80e61ed2272261e19755355bad34ab549dd023a80c688')

pkgver() {
  local v
  v="$(grep -Eo '^VOPK_VERSION="[^"]+"' "$srcdir/vopk" | cut -d'"' -f2 || true)"
  if [[ -n "$v" ]]; then
    printf '%s' "$v"
  else
    date -u +%Y%m%d
  fi
}

package() {
  install -Dm755 "$srcdir/vopk" "$pkgdir/usr/bin/vopk"
}

