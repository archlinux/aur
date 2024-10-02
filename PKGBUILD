# Maintainer: SelfRef <arch@selfref.dev>

_basename=overlayed
pkgname=${_basename}-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A modern, open-source, and free voice chat overlay for Discord (bin version)"
arch=('x86_64')
url="https://overlayed.dev"
license=('AGPL-3.0')
depends=('webkit2gtk-4.1' 'libayatana-appindicator' 'openssl')
makedepends=('tar')
optdepends=('discord: Needed for overlay to work')
provides=("$_basename")
conflicts=("$_basename")
source=("https://github.com/overlayeddev/overlayed/releases/download/v${pkgver}/overlayed_${pkgver}_amd64.deb")
sha256sums=('9e5736e17f23b13892703dcbe44c9a32676fbc51e548b585e890afee02dafb59')

prepare() {
	tar -xvf data.tar.gz
}

package() {
	cp -r usr $pkgdir/
}
