# Maintainer: Shanto <shanto@hotmail.com>

pkgname=fontconfig-infinality
pkgver=1
pkgrel=3
_pkgdate=20130104
_pkgrel=1
pkgdesc="Fontconfig files for use with freetype2-infinality."
arch=(any)
license=('GPL')
url="http://www.infinality.net/blog/infinality-freetype-patches/"
depends=('fontconfig' 'freetype2-infinality')
install='install.sh'
backup=(
	'etc/fonts/infinality/infinality.conf'
	'etc/fonts/conf.d/52-infinality.conf'
)
source=(
	"http://www.infinality.net/fedora/linux/zips/fontconfig-infinality-${pkgver}-${_pkgdate}_${_pkgrel}.tar.bz2"
)
package() {
	_destdir="$pkgdir"/etc/fonts
	mkdir -p $_destdir/{conf.avail,conf.d,infinality} "$pkgdir"/usr/bin
	cp -r "$srcdir"/{conf.avail,conf.d,infinality} $_destdir
	ln -sf /etc/fonts/infinality/infctl.sh "$pkgdir"/usr/bin/infctl
}
md5sums=('d7a7781865f3a76d70e32e074a63411c')
