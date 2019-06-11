#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
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
_rev='r01'
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
sha1sums=('b1e10d134ac69f5e746e9be8015122b18d43c235')
sha256sums=('2c9e961858e03900ffa0801a4f6234aa7223363b629fd8e1be60da9aa09d86bd')

package() {
	_destdir="${pkgdir}/opt/android-sdk/platforms"
	mkdir -p "${_destdir}"
	mv "${srcdir}/android-${_sdkShortVer}" "${_destdir}/android-${_apilevel}"
	chmod -R ugo+rX "${pkgdir}/opt"
}