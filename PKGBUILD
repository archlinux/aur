# Maintainer: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.4.2.1698
pkgrel=2
pkgdesc="Fortinet VPN client ZTNA edition"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator-gtk2')
options=('!strip')
source=("https://repo.fortinet.com/repo/forticlient/7.4/ubuntu22/pool/non-free/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('011aef6ec2752ba93b9c0d44ce3a3fb640368f66c932470be56d1a28fffa8be98f1b0f2670733d0eb5894fd0886a3917673042524c635dd538ab2808eaaf8903')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}

