# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=85.0.1
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
validpgpkeys=('031F7104E932F7BD7416E7F6D2845E1305D6E801')
options=(!emptydirs)

_uploadh_aarch64='09394fef1ed9b6c6a3d9e6ff64bc3a7d'
_uploadh_sig_aarch64='23dc91c463725df6cea62d8b2deb65d1'
_uploadh_x86_64='24f83f79bfd15e0cb2cf85856ca3163d'
_uploadh_sig_x86_64='b5cd3404ded1ba20e297c403e761f440'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_sig_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
_uploadpath_sig_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig"
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('2b15dc66e56beaedd35cd3f4aa0e0c71ccc0ffb6357425b82164831ab65f5ce6'
                   'SKIP')
sha256sums_aarch64=('c6f1ca2df1b548e79d4da7fdc3b07db9c5c9fb66bdd750631671d1b03a99d371'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
