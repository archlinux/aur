# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=90.0
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

_uploadh_aarch64='1434741762'
_uploadh_sig_aarch64='c54ee108937a48ee90029f8de3c90ea9'
_uploadh_x86_64='1432480548'
_uploadh_sig_x86_64='2b2b648cac18e8c107b2cd09e2eb5581'
_uploadpath_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_aarch64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst
_uploadpath_sig_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig
_uploadpath_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_x86_64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst
_uploadpath_sig_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('749cc3dd5eb8241c326052a11018e43e432ebf296374153dd9033fdffdbb08dd'
                   'SKIP')
sha256sums_aarch64=('f01d03079cc1c42c73d1f3e25ab48846090bc6928126b3185e635ab34a723f4f'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
