# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=89.0.1
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

_uploadh_aarch64='1355418969'
_uploadh_sig_aarch64='5a842fa0a7f47601ba8a69b7145b64a8'
_uploadh_x86_64='1355084867'
_uploadh_sig_x86_64='297bdf005abc3f73fe67f7f9e36022da'
_uploadpath_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_aarch64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst
_uploadpath_sig_aarch64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_aarch64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-aarch64.pkg.tar.zst.sig
_uploadpath_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh_x86_64}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst
_uploadpath_sig_x86_64=https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh_sig_x86_64}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst.sig
source_aarch64=("${_uploadpath_aarch64}" "${_uploadpath_sig_aarch64}")
source_x86_64=("${_uploadpath_x86_64}" "${_uploadpath_sig_x86_64}")
sha256sums_x86_64=('fc2ee4d1b2c366b7052d42e1d2b4d19a9a204387663b0bc0fe048e5b7ae86061'
                   'SKIP')
sha256sums_aarch64=('c01da7dd9bca68f138061c721d518c0e2a1d212286b91f5ded2d5db327b5a350'
                    'SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
