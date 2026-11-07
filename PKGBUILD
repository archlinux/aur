# Maintainer: Nasir <https://github.com/NasirA1991>
pkgname=honrp-bin
pkgver=0.3.6
pkgrel=1
pkgdesc='Discord Rich Presence for Heroes of Newerth (Juvio) on Linux/Steam Proton'
arch=('x86_64')
url='https://github.com/NasirA1991/honrp'
license=('MIT')
provides=('honrp')
conflicts=('honrp')
options=('!strip')
source=(
  "honrp-${pkgver}-linux-x86_64::https://github.com/NasirA1991/honrp/releases/download/v${pkgver}/honrp-linux-x86_64"
  "LICENSE::https://github.com/NasirA1991/honrp/raw/v${pkgver}/LICENSE"
  "config.example.json::https://github.com/NasirA1991/honrp/raw/v${pkgver}/config.example.json"
)
sha256sums=('e16001ed427597bc86074f2e274c475ef8dbf8ea42931fb6b81c1be9efa0a9c8' '8fcdd0dd9c0c06c3e94507870588dd73e04b460562ff01b9680e155d84c395a8' '4d53f8515828dc7c9a6e3e0e85389b1316d5e6e4dd11a13af7d4b25eb6d14c2a')

package() {
  install -Dm755 "$srcdir/honrp-${pkgver}-linux-x86_64" "$pkgdir/usr/bin/honrp"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/config.example.json" "$pkgdir/usr/share/honrp/config.example.json"
}

post_install() {
  cat <<'MSG'
Finish setup as your user (not root):
  honrp install
Restart Heroes of Newerth afterwards.
MSG
}
