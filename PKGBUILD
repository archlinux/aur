# Maintainer: Nasir <https://github.com/NasirA1991>
pkgname=honrp-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Discord Rich Presence for Heroes of Newerth (Juvio) on Linux/Steam Proton'
arch=('x86_64')
url='https://github.com/NasirA1991/honrp'
license=('MIT')
provides=('honrp')
conflicts=('honrp')
options=('!strip')
source=(
  "honrp-linux-x86_64::https://github.com/NasirA1991/honrp/releases/download/v${pkgver}/honrp-linux-x86_64"
  "LICENSE::https://github.com/NasirA1991/honrp/raw/v${pkgver}/LICENSE"
  "config.example.json::https://github.com/NasirA1991/honrp/raw/v${pkgver}/config.example.json"
)
sha256sums=('d1ce95c8485ff53f68be8606d8bea1e36c4c927d7e639e7e660eb67fa8ec0d24' '8fcdd0dd9c0c06c3e94507870588dd73e04b460562ff01b9680e155d84c395a8' '7f2324947e60c9675b50c50682979d7a2c1b5d1583a133d469cbda380f468f1c')

package() {
  install -Dm755 "$srcdir/honrp-linux-x86_64" "$pkgdir/usr/bin/honrp"
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
