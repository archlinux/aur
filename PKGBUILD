# Creator: gardenapple <mailbox@appl.garden>

pkgname=mozillavpn-bin
_pkgname="${pkgname%-bin}"
pkgver=2.29.0
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
sha256sums=('24dc486884b2de3f09fb4a0dfda1711b2d7c7aaeae33fd63d45e3b93cbc83216')

package() {
	cd "$srcdir"
	bsdtar -x -f 'data.tar.gz' -C "$pkgdir"

	cd "$pkgdir"
	mv lib/{mozilla,mozillavpn} usr/lib/
	rmdir lib
}
