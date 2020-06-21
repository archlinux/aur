#@IgnoreInspection BashAddShebang
# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Contributor: farwayer <farwayer@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_apilevel=29
_sdkShortVer=10
_sdkver="${_sdkShortVer}.0.0"
_rev='r04'
#_sdkver_char='Q' Not using it yet as it hasn't been revealed. Will probably be Q. Let me know if you find out.
pkgname="android-platform-${_apilevel}"
pkgver="${_apilevel}_${_sdkver}_${_rev}" # I use this version labeling scheme as an attempt to work with all notations.
# across `AUR`. Some use the `API` level, some use the `SDK` version. This way, all the numbers are visible and this
# should be a "higher number" than other versioning schemes (except between `API` levels and some very old versions).
pkgrel=1
pkgdesc="Android SDK Platform, API ${_apilevel}"
arch=('any') # I actually don't think it works on x86, or not in a fine way. That requires some testing I don't have
# the time to do anyway.
url="https://developer.android.com/sdk/index.html"
license=('custom') # TODO: Link to the license.
depends=('android-sdk' 'android-sdk-platform-tools')
options=('!strip')
source=("https://dl.google.com/android/repository/platform-${_apilevel}_${_rev}.zip")
sha1sums=('8d644c39902038e0bd529165d5ba4f5a8607daea')
sha256sums=('c9eaf2ce4e8fa6f5a8036bd3c95363d003733bf0a1bd349718cadf802db44c69')

package() {
	_destdir="${pkgdir}/opt/android-sdk/platforms"
	mkdir -p "${_destdir}"
	mv "${srcdir}/android-${_sdkShortVer}" "${_destdir}/android-${_apilevel}"
	chmod -R ugo+rX "${pkgdir}/opt"
}
