# Maintainer: xuanping <a845326948 at gmail dot com>

# A macOS-feel libinput acceleration curve for the COSMIC touchpad, shipped as a
# cosmic-config *system default* at /usr/share/cosmic/com.system76.CosmicComp/v1/
# input_touchpad. cosmic-comp reads this whenever the user has no per-user
# override (~/.config/cosmic/...), so on a fresh machine the curve applies just
# by installing this package -- no command to run.
#
# Requires a cosmic-comp built with the `custom-accel` feature (PR#2397); stock
# cosmic-comp cannot deserialize `profile: Custom`. The AUR package
# cosmic-comp-inhibit-export provides exactly that, hence the depends below.
# Curve: libinput custom accel points, step 0.5 dev-units/ms, 22 points, ~1.9x
# cap -- the same shape as the KWin kwin!6937 macOS-trackpad setup.

pkgname=cosmic-comp-macos-touchpad-curve
pkgver=1
pkgrel=1
pkgdesc='macOS-style libinput accel curve for the COSMIC touchpad, installed as a /usr/share/cosmic default (auto-applies unless you have a per-user override)'
arch=(any)
url='https://github.com/lxp-git/cosmic-ext-applet-inhibit-status'
license=(GPL-3.0-only)
depends=('cosmic-comp-inhibit-export')
source=('input_touchpad'
        'cosmic-apply-macos-touchpad-curve')
b2sums=('c572e6f56f8a323b586c911c3599eba715a77bef18f065826ba84ec122127cd97655a5117e044326d9c8844014a054ffa6b5776f767ba55151466b0c5d94ba0b'
        '7336e5bbafbbf967042e14804d29bb7006c42d08523b95063211e8324a16ab52240fb1c25a48e79379c34e63d458e38e20ecb7cc103e04323c179b4a8dc99daf')

package() {
  install -Dm644 input_touchpad \
    "$pkgdir/usr/share/cosmic/com.system76.CosmicComp/v1/input_touchpad"
  install -Dm755 cosmic-apply-macos-touchpad-curve \
    "$pkgdir/usr/bin/cosmic-apply-macos-touchpad-curve"
}

# vim: ts=2 sw=2 et:
