# Maintainer: gurg <gurg@noreply.codeberg.org>

pkgname=bigkis-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Declarative package bundle manager for Arch Linux'
arch=('x86_64')
url='https://codeberg.org/gurg/bigkis'
license=('MIT')
depends=('sudo')
optdepends=(
  'yay: AUR helper support'
  'paru: AUR helper support'
  'flatpak: flatpak plugin support'
  'npm: node plugin support'
  'pnpm: node plugin support'
  'yarn: node plugin support'
)
provides=('bigkis')
conflicts=('bigkis')
options=('!strip' '!debug')
source=(
  "bigkis-linux-amd64::${url}/releases/download/v${pkgver}/bigkis-linux-amd64"
  "upstream-LICENSE::${url}/raw/tag/v${pkgver}/LICENSE"
)
sha256sums=(
  '237f3cc7c6e469f639649d7493fbfcfad866d3cc626131c0cd63dd77defa9cab'
  '9be548f8ac17e571d7a82ab7931d4c761d75855cba77f2f58d50018e6faf1f1b'
)

package() {
  install -Dm755 "${srcdir}/bigkis-linux-amd64" "${pkgdir}/usr/bin/bigkis"
  install -Dm644 "${srcdir}/upstream-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
