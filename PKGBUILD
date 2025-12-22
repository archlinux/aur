pkgname=vopk
pkgver=1.2.0
pkgrel=1
pkgdesc="VOPK — unified cross-distro package frontend"
arch=('any')
url="https://github.com/gpteamofficial/vopk"
license=('GPL-3.0-only')
depends=('bash')

source=("vopk::https://raw.githubusercontent.com/gpteamofficial/vopk/main/src/vopk.sh")
sha256sums=('SKIP')

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

