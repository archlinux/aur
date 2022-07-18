# Maintainer: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=7.0.6.0214
pkgrel=1
pkgdesc="An endpoint protection application"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator-gtk2')
backup=('etc/forticlient/config.db')
options=('!strip' '!emptydirs')
source=("https://repo.fortinet.com/repo/7.0/ubuntu/pool/multiverse/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('a885658f50e06814e3f3a933c2cc6ff67a74b3e641292586b529f51ecf02e866a0798f7cdeb687793403420c87d817a2fd832e3bc33e75f9cffde1a1ce8d1d93')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
