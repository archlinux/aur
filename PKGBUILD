# Maintainer: Rhys <aur at rhysperry dot com>
# Contributor: Meowser <edward dot o dot holmes at gmail dot com>
# Contributor: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
# Contributor: dnikoloski <nikoloskid at proton dot me>
pkgname=forticlient
pkgver=8.0.0.0055
pkgrel=1
pkgdesc="Fortinet VPN client ZTNA edition"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=()
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator' 'org.freedesktop.secrets')
optdepends=('qt5-webengine: Webengine-based authentication popup support')
options=('!strip')
source=("https://repo.fortinet.com/repo/forticlient/8.0/ubuntu/pool/non-free/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('29bbec981c29801bef80a4ec546228badeaeea0604bd7034ef49f7cb63e589b5f1cf62a48dc676e62e51257ef46476f79e615e700a3d69a0b2154e111e6e6f95')
package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir -p var/lib/forticlient

	cd ..

}

