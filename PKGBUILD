# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
pkgname=nautilus-search-by-image-git
_pkgname=nautilus-search-by-image
pkgver=r1.e60fa62
pkgrel=1
pkgdesc="Nautilus extension to do a reverse image search in Google from a local file (beware that this uploads images to transfer.sh and Google so use only if no privacy concerns)."
arch=('any')
url="https://github.com/jle64/nautilus-search-by-image"
license=('GPL')
depends=('python2-nautilus' 'python2-requests')
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
        cp google-image.py $pkgdir/usr/share/nautilus-python/extensions
}
