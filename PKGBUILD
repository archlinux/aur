# Maintainer: Melvin Vermeeren <mail@mel.vin>
# If you would like to contribute, place a comment or send an email.
# These profiles may not work for all setups, they're only tested on my desktop.
pkgname=firejail-profiles
pkgver=1.7
pkgrel=1
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-profiles/"
license=('GPL2')
source=("firefox-restricted.profile")
sha256sums=('725dca226d70d9aa30d66cd07c830681defdfb4f580a61095c3c293053099ac7')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/etc/firejail"

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
}
