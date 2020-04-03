# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=74.0
pkgrel=5
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs)

case "$CARCH" in
        aarch64) _uploadh='494547396'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
                sha256sums+=('b1fcdb207961a6aece4f88b6288cd5bb10d6be81e28d477b47cb4bb846703c89')
                ;;
        x86_64) _uploadh='494561232'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                sha256sums+=('8d2a55367732c51ca1ecc1a0ab7a3eec6ba96b78fa99a06d921e7240ac76b219')
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
