# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=80.0
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

_uploadh_aarch64='51af1bd574bf6c2777cd3bbff9aa21a6'
_uploadh_x86_64='e3b2fc64b1adb8892c0e6b1282375a23'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source_aarch64=("${_uploadpath_aarch64}")
source_x86_64=("${_uploadpath_x86_64}")
sha256sums_x86_64=('441e1f32bb334197399b8de3cad2058bc107125600e1023fada419d8970879c1')
sha256sums_aarch64=('2ddf217a635b1af9296082603dd8c6c460956220cf0e190c3cb744915945d50a')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
