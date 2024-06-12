# Maintainer: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=7.4.0.1636
pkgrel=1
pkgdesc="Fortinet VPN client ZTNA edition"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator-gtk2')
options=('!strip' '!emptydirs')
source=("https://repo.fortinet.com/repo/forticlient/7.4/ubuntu22/pool/non-free/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('67e8e3cd48e68b437b277e4147e7dd3f24463a83fef163f2e935649acffa27b1a589d52f88c334236ddf9470d1f582bc35f3ac767b0370efbeb035c6c5060f6f')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}

