# Maintainer: Melvin Vermeeren <mail@melvinvermeeren.com>
# If you would like to contribute, place a comment or send an email.
# These profiles may not work for all setups, they're only tested on my desktop.
pkgname=firejail-profiles
pkgver=1.0
pkgrel=1
pkgdesc="Extra profiles for firejail"
arch=('any')
url="https://aur.archlinux.org/packages/firejail-profiles/"
license=('GPL2')
source=("firefox-restricted.profile"
        "teamspeak3.profile")
sha256sums=('036fbeef1a4309e2ee3a07286039f951b0543d531ec6c98f9f20466c3b80fb6c'
            '32c1f93cd84a4e2f7af62a4be4239e89f7cb0b027ddb6cbfbff57fe5f41a6fda')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/etc/firejail"

	for file in ${srcdir}/*.profile
	do
		install -D -m644 "${file}" "${pkgdir}/etc/firejail/"
	done
}
