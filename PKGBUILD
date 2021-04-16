# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=87.0
pkgrel=2
_pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
validpgpkeys=('031F7104E932F7BD7416E7F6D2845E1305D6E801')
options=(!emptydirs)

_uploadh_aarch64='995d8cdffa3ee9b56e492e31dd6d268d'
_uploadh_sig_aarch64='a16ae5cdca79a92c1d76eed74df1467c'
_uploadh_x86_64='87630bd04e5a581bf9250e5c81dce80a'
_uploadh_sig_x86_64='6552f89f95e6946db6e28f7234bafd29'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_sig_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-aarch64.pkg.tar.zst.sig"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst"
_uploadpath_sig_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst.sig"
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('a20dbc4067b451fbb10d902ad790987da9cd765fb3db7e6266bc723e6a881bf2'
                   'SKIP')
sha256sums_aarch64=('473487a7a603ac910cb8750602619bc809a2fa1b1c3d53a04f3288fcf37262b9'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
