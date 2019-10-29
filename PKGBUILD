#@IgnoreInspection BashAddShebang
# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy at artphotolaurent dot be>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Christoph Bayer <chrbayer@criby.de>
# Contributor: Bence Hornák <hornak dot bence at gmail dot com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Joel Pedraza <joel@joelpedraza.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>

_apilevel=29
_sdkver='10.0.0'
_rev='r07'
_image_arch='x86_64'
_sdkver_char='Q'
pkgname="android-${_image_arch/x86_/x86-}-system-image-${_apilevel}"
pkgver="${_apilevel}_${_sdkver}_${_rev}" # I use this version labeling as an attempt to work with all notations.
# across `AUR`. Some use the `API` level, some use the `SDK` version. This way, all the numbers are visible and this
# should be a "higher number" than other versioning schemes (except between `API` levels and some very old versions).
pkgrel=1
pkgdesc="Android ${_image_arch} system image, API ${_apilevel}"
arch=('any') # I actually don't think it works on x86, or not in a fine way. That requires some testing I don't have
# the time to do anyway.
url="https://developer.android.com/studio/index.html"
license=('custom') # TODO: Link to the license.
depends=("android-platform-${_apilevel}")
provides=("android-${_image_arch/x86_/x86-}-system-image")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/${_image_arch}-${_apilevel}_${_rev}-linux.zip")
sha1sums=('c8e307b885a68f71b4889a70bffea729fc4ecbfa')
sha256sums=('19686a92b24ab71d6b1c74af6602252d62ea6d860964f23d6e1da2f13a611d87')

package() {
	_destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
	mkdir -p "${_destdir}"
	mv "${srcdir}/${_image_arch}" "${_destdir}"
	chmod -R ugo+rX "${pkgdir}/opt"
}
