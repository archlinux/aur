# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=augratin
pkgver=25.5.18
pkgrel=1
pkgdesc="Ham Radio - An aid for POTA hunters"
url="https://pypi.org/project/augratin/"
depends=(python python-psutil python-requests python-pyqt6-webengine python-folium hamlib hamradio-menus)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=(GPL-3.0-only)
arch=(any)
provides=(augratin)
conflicts=(augratin-git)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver.tar.gz)
#	$pkgname.1)

build() {
	cd $srcdir/$pkgname-$pkgver

	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python -m installer --destdir="$pkgdir" dist/*.whl

#	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
#	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm755 $pkgname/data/k6gte-$pkgname.desktop $pkgdir/usr/share/applications/k6gte-$pkgname.desktop
	install -Dm755 $pkgname/data/k6gte-$pkgname-128.png $pkgdir/usr/share/pixmaps/k6gte-$pkgname.png
}
md5sums=('c5470c7496d18dc761636f13f0937f37')
sha256sums=('0d5ff82d3df2323ee11e31741bbc71d877b9913c45a936a681722ad8a5d798da')
