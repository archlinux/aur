# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Maintainer: Robin Becker <robin@reporrtlab.com>

pkgname=xcursor-neutral++
pkgver=1.0.3
pkgrel=5
pkgdesc="Icon set based on Neutral and jaguarx themes."
arch=('any')
url="https://github.com/ducakar/xcursor-neutralxx"
license=('Artistic 2.0')
source=(git+$url.git)
makedepends=('xorg-xcursorgen')
sha256sums=('SKIP')

build() {
	true
	}

prepare(){
	cd $srcdir
	[ ! -h Neutral++ ] && ln -s xcursor-neutralxx Neutral++
	cd Neutral++/source
	./make.sh
	}

package(){
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r Neutral++/ $pkgdir/usr/share/icons
	rm -rf $pkgdir/usr/share/icons/Neutral++/{source,.git}
	}
