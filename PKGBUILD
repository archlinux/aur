# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=80.0.1
pkgrel=1
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

_uploadh_aarch64='c1ad9ce9d8f96eba677d8827931fa8ac'
_uploadh_x86_64='87e1340dcdcd717593243e6b78b15023'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source_aarch64=("${_uploadpath_aarch64}")
source_x86_64=("${_uploadpath_x86_64}")
sha256sums_x86_64=('523701fc48bf9c571480ba4fde733f46a6ae3d1a6007c100126be6f75121ade3')
sha256sums_aarch64=('0e851e4397338c16bc7c016693cd37b78722b1af543bed91a7a81e9848678aee')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
