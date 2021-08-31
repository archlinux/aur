# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=91.0.2
pkgrel=1
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

_uploadh_aarch64='1545275520'
_uploadh_sig_aarch64='5fa7621a902c1550bbee9a414210617c'
_uploadh_x86_64='1545275517'
_uploadh_sig_x86_64='c44cc2a4e218701c801455290e3486e0'
_uploadpath_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_aarch64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst
_uploadpath_sig_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig
_uploadpath_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_x86_64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst
_uploadpath_sig_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('1aca659cc3f00a074c0d251f66839d6a9f8f317f7fa8b160426d735ff43b7443'
                   'SKIP')
sha256sums_aarch64=('93510481ea8fcf54d0f523c57ad1a32844c59186d7faad61946248c693accf61'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
