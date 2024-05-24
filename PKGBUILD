# Maintainer: agamemnon <zarberus at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.2.4.0809
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
sha512sums=('417ab5bf8623f81f2894aef9e8e1415d48ca13be098de989036a99d2289953398614b9af8594608b037b9fe6e676f079ba9f6d357d96b36eea92c319fa44cd89')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}
