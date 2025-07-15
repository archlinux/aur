# Maintainer: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.4.3.1736
pkgrel=3
pkgdesc="Fortinet VPN client ZTNA edition"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator-gtk2' 'org.freedesktop.secrets')
options=('!strip')
source=("https://repo.fortinet.com/repo/forticlient/7.4/ubuntu22/pool/non-free/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('214825cec434c4e5d250e620ce6dc9d49a2157233c6d10d6efd707cb29040f20dffa82859431e631cec37084165ad922f822b87d6c4ad6476aee965dc55a120d')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}

