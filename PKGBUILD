# Creator: gardenapple <mailbox@appl.garden>

pkgname=mozillavpn-bin
_pkgname="${pkgname%-bin}"
pkgver=2.24.3
_ubuntuver=oracular
pkgrel=1
_origpkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox (Ubuntu PPA binary)"
arch=('x86_64')
url='https://vpn.mozilla.org'
license=('MPL-2.0 AND MIT AND Apache-2.0 AND LGPL-3.0')
depends=('glib2'
         'hicolor-icon-theme'
         'libcap'
         'libsecret'
         'openssl'
         'qt6-5compat'
         'qt6-base'
         'qt6-declarative'
         'qt6-networkauth'
         'qt6-websockets')
provides=("$_pkgname")
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+files/mozillavpn_${pkgver}-${_ubuntuver}${_origpkgrel}_amd64.deb")
sha256sums=('7239dd77d56250b72c90cf9da8b399a284a24481e1cfd1e51afc7a58ecdd899f')

package() {
	cd "$srcdir"
	bsdtar -x -f 'data.tar.gz' -C "$pkgdir"

	cd "$pkgdir"
	mv lib/{mozilla,mozillavpn} usr/lib/
	rmdir lib
}
