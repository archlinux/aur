# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=77.0.1
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

_uploadh_aarch64='584404499'
_uploadh_x86_64='584398353'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh_aarch64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh_x86_64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz"
source_aarch64=(${_uploadpath_aarch64})
source_x86_64=(${_uploadpath_x86_64})
sha256sums_aarch64=('d47ae8c840c07296b263c2a28d27e25eb49bb9eeb4db8e145d1e47c47877352b')
sha256sums_x86_64=('3ffafdf3c99f0930d551d2c2ba3a160cc6775f665825ebe9d5130ba61986aeec')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
