# Maintainer: Melvin Vermeeren <mail@mel.vin>
# If you would like to contribute, place a comment or send an email.
# These profiles may not work for all setups, they're only tested on my desktop.
pkgname=firejail-profiles
pkgver=1.3
pkgrel=1
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-profiles/"
license=('GPL2')
source=("firefox-restricted.profile"
        "teamspeak3.profile")
sha256sums=('b8f467106258564915701bac0155503a6693f2e6cac055afac45ff16d42a75a5'
            'a322fd46bdd3aaa0ad1fb28f2fbe76173a1a410bd30dad9adb5cca3446a8f3ea')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/etc/firejail"

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
}
