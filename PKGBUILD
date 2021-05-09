# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=88.0.1
pkgrel=1
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
backup=('usr/lib/librewolf/librewolf.cfg'
        'usr/lib/librewolf/distribution/policies.json')
options=(!emptydirs)
install='librewolf-bin.install'

_uploadh_aarch64='1240727696'
_uploadh_sig_aarch64='3a9d44c8ec10563eab379d25bc07d74b'
_uploadh_x86_64='1240727695'
_uploadh_sig_x86_64='1a7ad15807f37dd46b895aae80a344d4'
_uploadpath_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_aarch64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-aarch64.pkg.tar.zst
_uploadpath_sig_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-aarch64.pkg.tar.zst.sig
_uploadpath_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_x86_64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst
_uploadpath_sig_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst.sig
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('58e77c9dcd762b50dbc12d79a4d53cff9e3bc4fad1a523c3f5369b264a4a01f9'
                   'SKIP')
sha256sums_aarch64=('93121d98071b13d0dab7eb1d629aad2700ab892b29938a379d0a457c26e7490c'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
