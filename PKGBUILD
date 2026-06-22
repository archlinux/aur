#Maintainer: Charlie Wolf <charlie@wolf.is>
#Contributor: Matt Monaco <net 0x01b dgbaley27>

pkgname=xlibre-video-nested
pkgver=25.0.0
pkgrel=1
pkgdesc="Driver to run Xorg on top of Xorg or something else."
url="https://github.com/X11Libre/xf86-video-nested"
license=("MIT")
source=("${url}/archive/refs/tags/xlibre-xf86-video-nested-${pkgver}.tar.gz")
sha256sums=('0efe66138df65a00f1340fc1ea58bc75e0e8180ca598feb2ef0c8b74202c4dba')
groups=("xorg-drivers")
arch=("x86_64" "i686")
provides=('xf86-video-nested')
conflicts=('xf86-video-nested' 'xf86-video-nested-git')
backup=()
depends=("libxext")
makedepends=("xlibre-xserver-devel")
options=("!libtool")

build()
{
	cd "$srcdir/xf86-video-nested-xlibre-xf86-video-nested-${pkgver}"

	./autogen.sh --disable-maintainer-mode --prefix=/usr --sysconfdir=/etc
	make
}

package()
{
	cd "$srcdir/xf86-video-nested-xlibre-xf86-video-nested-${pkgver}"
	make DESTDIR="$pkgdir" install
}

# vim: set noet :
