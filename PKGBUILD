# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# you can change color of rendered object here
# format: RGB
# scale: [0,1]

__color__="1,.5,0"

pkgname=stl-thumbnailer
pkgver=1
pkgrel=1
pkgdesc="Allow file managers (nautilus,caja etc) to geterate thumbnails for stl files using openscad"
arch=('any')
url="https://www.thingiverse.com/thing:258653"
license=('GPL')
groups=()
depends=(openscad python2)
makedepends=(sed)
source=("stl.thumbnailer"
        "stl.thumbnailer.py")
md5sums=('2e86d05c56f013b5030caf6e5b03a856'
         '8ab41a0aa264ecdeff07d427d35a21e1')

prepare() {
	cd ${srcdir}
	sed -i "s/__color__/$__color__/" stl.thumbnailer.py
}

package() {
	cd ${srcdir}
	install -D -m 755 stl.thumbnailer.py ${pkgdir}/usr/bin/stl.thumbnailer.py
	install -D -m 644 stl.thumbnailer ${pkgdir}/usr/share/thumbnailers/stl.thumbnailer
}

