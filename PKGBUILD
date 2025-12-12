# Maintainer: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.4.5.1835
pkgrel=1
pkgdesc="Fortinet VPN client ZTNA edition"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator-gtk2' 'org.freedesktop.secrets')
options=('!strip')
source=("https://repo.fortinet.com/repo/forticlient/7.4/ubuntu22/pool/non-free/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('4b24f6c4135ebab937cc3eb594f74b866fc1b5b06e52fdf0de212c67e6c980bc6df86e9687813f638f0fb65c12e54450ecb825fff54df3edb6bc99a35020c5f5')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}

