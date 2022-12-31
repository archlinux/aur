# Maintainer: lsf <lsf at pfho dot net>

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=108.0.1
pkgrel=1
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
sha256sums_x86_64=('3d8541e05e4c19a13dca8a8ff69a5969596a72419ea248e342682f6c9044a91f'
                   'SKIP')
sha256sums_aarch64=('4daecdd2edc34a062382ad4d1f03e766c30aa06a6eaa0d460bcba8a5f124a589'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
