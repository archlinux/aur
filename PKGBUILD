# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=81.0
pkgrel=2
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

_uploadh_aarch64='f9e51724ad89c423c2e5651c05504a80'
_uploadh_x86_64='9c626c79bf6e128011b85ab8473d4e30'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source_aarch64=("${_uploadpath_aarch64}")
source_x86_64=("${_uploadpath_x86_64}")
sha256sums_x86_64=('ea1fd413417dcdfc2f0d7ff8113d602227b622da312459b9a35d4843ebb33747')
sha256sums_aarch64=('3fb5036849ded19e42d4ed799071db41fe05bac0f25bfd7df9768f550c96f0c6')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
