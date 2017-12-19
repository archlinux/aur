# Maintainer: Melvin Vermeeren <mail@mel.vin>
# If you would like to contribute, place a comment or send an email.
# These profiles may not work for all setups, they're only tested on my desktop.
pkgname=firejail-profiles
pkgver=1.6
pkgrel=1
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-profiles/"
license=('GPL2')
source=("firefox-restricted.profile")
sha256sums=('e893981b770de490414f51948db8105a58765a98820920d2191cf2e438cec0cb')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/etc/firejail"

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
}
