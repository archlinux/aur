# Maintainer: Marius Knaust <marius.knaust@gmail.com>

_name=inkscape-applytransforms
pkgname=$_name-git
pkgver=r38.bc65583
pkgrel=1
pkgdesc="An Inkscape extension which removes all matrix transforms by applying them recursively to shapes"
arch=("any")
url="https://github.com/Klowner/$_name"
license=("GPL2")
depends=("inkscape" "python-lxml")
makedepends=("git")
provides=("_name")
conflicts=("_name")
source=("git+https://github.com/Klowner/$_name.git")
md5sums=("SKIP")

pkgver()
{
	cd "$_name"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
	cd "$srcdir/$_name"

	install -m755 -Dt "$pkgdir/usr/share/inkscape/extensions" applytransform.py
	install -m644 -Dt "$pkgdir/usr/share/inkscape/extensions" applytransform.inx
}
