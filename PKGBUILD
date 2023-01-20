# Maintainer: Brendan <ball dot brendan 50 at gmail dot com>
# Contributor: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=7.0.7.0246
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
sha512sums=('d27bd7d570190f8717ec0c6d196faf43962d17dc36566dd648560dce7059a42cedc24f8176823f2b71aa8cdcd74977dab015a3deba2b1a35e2faa75aa580ba04')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib
	mkdir /var/lib/forticlient

	cd ..

}
