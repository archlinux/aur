# Maintainer: autune1 <autune1 at gitlab dot com>
# Contributor: Valve Corporation <holo-main package: holo-realtek-firmware-toggles 1.4>
# Upstream SteamOS package ported for desktop Linux hosts streaming to a Steam
# Frame. Steam calls /usr/bin/holo-polkit-helpers/holo-realtek-firmware-toggles
# set-low-latency-mode on|off when the wireless adapter (28de:2432) connects or
# disconnects; this package provides that helper and its polkit policy.
# Source mirrored by evlaV/holo (unofficial SteamOS source package mirror).

pkgname=holo-realtek-firmware-toggles
pkgver=1.4
pkgrel=1
_commit=a49f24b1f9900f53300e1ae690f8a2e2728b3c84
pkgdesc="Valve's SteamOS low-latency helper for the Steam Frame wireless adapter (desktop Linux port)"
arch=('any')
url="https://github.com/evlaV/holo"
license=('MIT')
depends=('bash' 'iw' 'polkit')
optdepends=('wireless-regdb: correct regulatory domain for 6 GHz')
source=("holo-realtek-firmware-toggles::https://raw.githubusercontent.com/evlaV/holo/$_commit/holo-realtek-firmware-toggles/holo-realtek-firmware-toggles"
        "org.valve.holo-realtek-firmware-toggles.policy::https://raw.githubusercontent.com/evlaV/holo/$_commit/holo-realtek-firmware-toggles/org.valve.holo-realtek-firmware-toggles.policy"
        "PACKAGE-LICENSE")
sha256sums=('0534273eb532593bfe977835666f88a9f50f5f2edd8d6792f55202f65ba757f8'
            '7e1c21c1b23b67d7baea989b85f96a8d8c611778b09449fb181619064cf7231e'
            '95807266839002dd0a7a15cbfe2faefb5a2653c10596480cf8c66f7629a1c610')
# sha256sums filled via makepkg -g below (pinned to $_commit, so they are stable)

package() {
  install -Dm755 holo-realtek-firmware-toggles \
      "$pkgdir"/usr/bin/holo-polkit-helpers/holo-realtek-firmware-toggles
  install -Dm644 org.valve.holo-realtek-firmware-toggles.policy \
      "$pkgdir"/usr/share/polkit-1/actions/org.valve.holo-realtek-firmware-toggles.policy
  install -Dm644 PACKAGE-LICENSE \
      "$pkgdir"/usr/share/licenses/holo-realtek-firmware-toggles/LICENSE
}
