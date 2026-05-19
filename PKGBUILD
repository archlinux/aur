# Maintainer: Rhys <aur at rhysperry dot com>
# Contributor: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.4.7.1868
pkgrel=1
pkgdesc="Fortinet VPN client ZTNA edition"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator' 'libappindicator-gtk2' 'org.freedesktop.secrets')
optdepends=('qt5-webengine: Webengine-based authentication popup support')
options=('!strip')
source=("https://repo.fortinet.com/repo/forticlient/7.4/ubuntu22/pool/non-free/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('fb2695dc3705388c1019fa24caba707ac0c3c92c77249708b6ac7527d3bec73f954ccc37bd39f9a0879e15b74b4976696f6df9c0d1ae312fefee9bea9a516e09')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}

