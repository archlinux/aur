# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=85.0.2
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
validpgpkeys=('031F7104E932F7BD7416E7F6D2845E1305D6E801')
options=(!emptydirs)

_uploadh_aarch64='676dd80439485a22df844f789ca475f7'
_uploadh_sig_aarch64='1f08353e9be95d09689d2d492b04135c'
_uploadh_x86_64='7ac66bb1953f58b95c1bae09e6e30015'
_uploadh_sig_x86_64='ebccba4739221847f47ccc9a2b399a14'
_uploadpath_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst"
_uploadpath_sig_aarch64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig"
_uploadpath_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
_uploadpath_sig_x86_64="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig"
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('90957f3e690fc69a69b5f94b64ace79ae61fb21762849d120246b79c47fce8b9'
                   'SKIP')
sha256sums_aarch64=('fb9e6a8c62db91ea03f14d4a426a85a88dd647a6621d6cc7f345c856e9ca22bb'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
