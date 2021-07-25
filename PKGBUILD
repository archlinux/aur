# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=phonic-git
_name=phonic
pkgver=0.0.10
pkgrel=1
pkgdesc="A GTK audiobook player targeted at mobile Linux."
url="https://bitbucket.org/hackersgame/phonic"
depends=('python' 'gtk3' 'sox')
makedepends=('python' 'git')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://www.bitbucket.org/hackersgame/${_name}.git")
sha256sums=('SKIP')
provides=('phonic')

pkgver() {
	cd ${_name}/packages/${_name}
	cat DEBIAN/control | grep Version: | cut -c 10- | tr "-" "."
}

package() {
	cd ${_name}/packages/${_name}
	
	install -Dm755 "usr/bin/phonic" "$pkgdir/usr/bin/phonic"
	install -Dm644 "usr/share/applications/phonic.desktop" "$pkgdir/usr/share/applications/phonic.desktop"
	install -Dm644 "usr/share/doc/phonic/copyright" "$pkgdir/usr/share/doc/phonic/copyright"
	install -Dm644 "usr/share/icons/phonic.png" "$pkgdir/usr/share/icons/phonic.png"
	install -Dm644 "usr/share/man/man1/phonic.1.gz" "$pkgdir/usr/share/man/man1/phonic.1.gz"
	install -Dm644 "usr/share/phonic/phonic.glade" "$pkgdir/usr/share/phonic/phonic.glade"
	install -Dm755 "usr/share/phonic/phonic.py" "$pkgdir/usr/share/phonic/phonic.py"
}

