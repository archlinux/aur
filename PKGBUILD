# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=99.0
pkgrel=2
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 libxt startup-notification mime-types dbus-glib
         nss ttf-font libpulse ffmpeg)
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

_project_id=12875785
_base_url=https://gitlab.com/api/v4/projects/${_project_id}/packages/generic/librewolf/${pkgver}-${pkgrel}
_uploadpath_aarch64=${_base_url}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst
_uploadpath_x86_64=${_base_url}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst
_uploadpath_sig_aarch64=${_base_url}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig
_uploadpath_sig_x86_64=${_base_url}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('4792aa9ac758074173d7cd763746f34af54d1bbfc5b8557bfdb7b394500500c8'
                   'SKIP')
sha256sums_aarch64=('fd08744adb37a7c7fd1feea7f90775fe40943fdd8b0b2ac424b49aeca6116121'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
