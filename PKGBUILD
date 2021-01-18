# Author: Davorin Učakar <davorin.ucakar@gmail.com>
# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Maintainer: Robin Becker <robin@reporrtlab.com>

pkgname=xcursor-neutral++
pkgver=1.0.3
pkgrel=6
pkgdesc="Icon set based on Neutral and jaguarx themes."
arch=('any')
url="https://github.com/ducakar/xcursor-neutralxx"
license=('Artistic 2.0')
source=(git+$url.git)
makedepends=('git' 'xorg-xcursorgen')
sha256sums=('SKIP')

prepare(){
	cd xcursor-neutralxx/source
	./make.sh
}

package() {
	install -Dm644 -t "$pkgdir"/usr/share/icons/Neutral++ \
		xcursor-neutralxx/{index.theme,LICENSE,README}
	cp -r xcursor-neutralxx/cursors "$pkgdir"/usr/share/icons/Neutral++/
}
