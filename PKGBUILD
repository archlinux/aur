pkgname=roton-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Roton Screen Recording App (binary release)"
arch=("x86_64")
url="https://github.com/ferdinankurnian/roton"
license=("MIT")
depends=(
  "slurp"
  "ffmpeg"
  "pipewire-pulse"
  "wl-screenrec"
)
source=(
  "roton-${pkgver}.tar.gz::https://github.com/ferdinankurnian/roton/releases/download/v${pkgver}/roton-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('b9d7c76746ce8eeedf7da36df65f0bd94a19a6eb983432f69db079008c621d5d')

package() {
  cd "${srcdir}/roton-v${pkgver}-linux-x86_64"

  install -Dm755 roton "$pkgdir/usr/bin/roton"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/roton/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/roton/README.md"

  install -Dm644 rotonicon.png \
    "$pkgdir/usr/share/pixmaps/roton.png"
}
