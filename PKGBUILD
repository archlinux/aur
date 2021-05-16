# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=nautilus-search-by-image-git
_pkgname=nautilus-search-by-image
pkgver=r4.2dcb126
pkgrel=2
pkgdesc="Nautilus extension to do a reverse image search in Google/Yandex from a local file context-menu."
arch=('any')
url="https://github.com/jle64/nautilus-search-by-image"
license=('GPL')
depends=('python-nautilus' 'python-requests')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=('nautilus-search-by-image::git://github.com/jle64/nautilus-search-by-image.git')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$_pkgname"
	mkdir -p $pkgdir/usr/share/nautilus-python/extensions
        cp search-by-image.py $pkgdir/usr/share/nautilus-python/extensions
}
