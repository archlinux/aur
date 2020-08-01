# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=79.0
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

_uploadh_aarch64='736d9f7e4602f7541199743d462e6d7b'
_uploadh_x86_64='fe41efb22143d5e3cf2bab762c387d7f'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source_aarch64=(${_uploadpath_aarch64})
source_x86_64=(${_uploadpath_x86_64})
sha256sums_x86_64=('e7c7cdf83478d15c8a56f34bfd752eb51039ac6b4efeef1eb4f09c5d240a610a')
sha256sums_aarch64=('256e4cbed5661574ac1cbf3e0ba6583705a1af53ea9a3539a2130d39dc391752')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
