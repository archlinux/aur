# Maintainer: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=7.0.1.0057
pkgrel=1
pkgdesc="An endpoint protection application"
arch=('x86_64')
url="https://www.forticlient.com"
license=('custom')
groups=('')
provides=(forticlient)
depends=('libxss' 'libsecret' 'alsa-lib' 'libnotify' 'gtk3' 'nss' 'libxcrypt-compat' 'libappindicator-gtk2')
backup=('etc/forticlient/config.db')
options=('!strip' '!emptydirs')
source=("https://repo.fortinet.com/repo/7.0/ubuntu/pool/multiverse/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('2d4598f5618c2de0789b80de9c9b7a720e2cce8e88e7e4bd8d1f1ac3c6b07f82f536c84c45560efac4a7750a0cb906122e43ba2d97046b2a7e1aa6cb0d1b56e7')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	cd ..

}
