# Maintainer: X0rg
# Contributor: Alessio Sergi <asergi at archlinux dot us>

_pkgbase=sonata
pkgname=python2-mmkeys
pkgver=1.6.2.1
pkgrel=2
pkgdesc="Multimedia key support as a PyGTK object"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sonata.berlios"
license=('GPL2')
depends=('pygtk' 'python2')
conflicts=('sonata')
source=("http://downloads.sourceforge.net/sourceforge/$_pkgbase.berlios/$_pkgbase-$pkgver.tar.gz")
md5sums=('0b912325e7175abad3bf6c0edc071e05')

prepare() {
	mkdir "$srcdir/$_pkgbase-$pkgver/fakeinstall"
}

build() {
	cd "$srcdir/$_pkgbase-$pkgver"
	python2 setup.py install --prefix=/usr --optimize=1 --root="$srcdir/$_pkgbase-$pkgver/fakeinstall"
}

package() {
	cd "$srcdir/$_pkgbase-$pkgver/fakeinstall"
	install -Dvm755 "./usr/lib/python2.7/site-packages/mmkeys.so" "$pkgdir/usr/lib/python2.7/site-packages/mmkeys.so"
}
