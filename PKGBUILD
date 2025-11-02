STDIN
pkgname=uqm-full
pkgver=0.8.0
pkgrel=4
pkgdesc="Complete Ur-Quan Masters data pack with voices and 3DO music for Arch/Garuda"
arch=('any')
url="https://sc2.sourceforge.net/"
license=('GPL-1.0-or-later')  # SPDX compliant
depends=('uqm')  # optional, remove if you want pure data only

source=(
  "uqm-0.8.0-voice.uqm"
  "uqm-0.8.0-3domusic.uqm"
)
noextract=('uqm-0.8.0-voice.uqm' 'uqm-0.8.0-3domusic.uqm')
sha256sums=('SKIP' 'SKIP')

package() {
  # core content paths
  install -d "${pkgdir}/usr/share/uqm/content/addons"
  install -d "${pkgdir}/usr/share/games/uqm/content/addons"

  install -Dm644 "uqm-0.8.0-voice.uqm" \
    "${pkgdir}/usr/share/uqm/content/addons/uqm-0.8.0-voice.uqm"
  install -Dm644 "uqm-0.8.0-3domusic.uqm" \
    "${pkgdir}/usr/share/uqm/content/addons/uqm-0.8.0-3domusic.uqm"

  # mirror for games path
  install -Dm644 "uqm-0.8.0-voice.uqm" \
    "${pkgdir}/usr/share/games/uqm/content/addons/uqm-0.8.0-voice.uqm"
  install -Dm644 "uqm-0.8.0-3domusic.uqm" \
    "${pkgdir}/usr/share/games/uqm/content/addons/uqm-0.8.0-3domusic.uqm"

  install -Dm644 /dev/null "${pkgdir}/usr/share/doc/${pkgname}/README"
  echo "This package installs the full UQM voice and 3DO music data into the correct addon paths." \
    > "${pkgdir}/usr/share/doc/${pkgname}/README"
}
