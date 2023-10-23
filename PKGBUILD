# Maintainer: agamemnon <zarberus at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.2.2.0753
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
source=("https://repo.fortinet.com/repo/forticlient/7.2/ubuntu/pool/multiverse/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('081bf7958d3c3205000d24e54b6132f5e5963f3ba32982b5f36d16fa63c9fe11d5429bf64c8a0af371fa0e2902e45580857aec27caaa5b8fd3d9594e087ab297')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}
