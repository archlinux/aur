# Maintainer: SelfRef <arch@selfref.dev>

_basename=chicago95
pkgname="${_basename}-plus"
pkgver=3.0.1
pkgrel=2
pkgdesc="Windows Plus! Theme Conversion for XFCE/Chicago95 (stable version)"
arch=('any')
url="https://github.com/grassmunk/Chicago95"
license=('GPL')
depends=('python' 'python-svgwrite' 'python-fonttools' 'python-numpy' 'imagemagick' 'inkscape' 'noto-fonts' 'alsa-utils')
optdepends=('chicago95-theme: Base theme')
makedepends=('git')
source=("chicago95::git+https://github.com/grassmunk/Chicago95.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$_basename/Plus"

	install -dm755 "$pkgdir/usr/lib/chicago95-plus"
	cp -r * "$pkgdir/usr/lib/chicago95-plus"
	install -Dm755 PlusGUI.desktop "$pkgdir/usr/share/applications/PlusGUI.desktop"

	install -dm755 "$pkgdir/usr/bin"
	printf '#!/bin/sh\n/usr/lib/chicago95-plus/ChicagoPlus.py' > "$pkgdir/usr/bin/ChicagoPlus"
	printf '#!/bin/sh\n/usr/lib/chicago95-plus/PlusGUI.py' > "$pkgdir/usr/bin/PlusGUI"
	chmod 755 "$pkgdir"/usr/bin/{ChicagoPlus,PlusGUI}
}
