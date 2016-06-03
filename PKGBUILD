# Maintainer: Melvin Vermeeren <mail@mel.vin>
# If you would like to contribute, place a comment or send an email.
# These profiles may not work for all setups, they're only tested on my desktop.
pkgname=firejail-profiles
pkgver=1.1
pkgrel=1
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-profiles/"
license=('GPL2')
source=("firefox-restricted.profile"
        "teamspeak3.profile")
sha256sums=('bb2f00f2c2cbad1ff5862017dd9bd9627fa0d5cd0069b19b808e8ea2c8714816'
            '4ac55e7034f289a21710a8771da56771850e6baed728cb2bc03b881dcee757dc')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/etc/firejail"

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
}
