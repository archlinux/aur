# Maintainer: Akkenoth <akkenoth at gmail dot com>

pkgname=colortail-git
pkgver=20160223.3b76525e
_gitver=3b7625ebaf3d80fa6a5951bdac00e16fcccf9dd9
pkgrel=1
pkgdesc="Colortail works like tail but can optionally read one or more config files where it's specified which patterns results in which colors."
arch=("i686" "x86_64")
url="https://github.com/joakim666/colortail"
license=("GPL")
groups=()
depends=()
makedepends=("git")
provides=("colortail")
conflicts=("colortail")
replaces=("colortail")
backup=()
options=()
install=
source=("https://github.com/joakim666/colortail/archive/${_gitver}.zip")
noextract=()
md5sums=("3d2af1106435de1fcd47ead4ce76a53d")

build() {
	cd "colortail-${_gitver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "colortail-${_gitver}"
	make DESTDIR="$pkgdir/" install
}
