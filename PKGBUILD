# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter:  not_anonymous <nmlibertarian@gmail.com>

pkgname=augratin
pkgver=23.6.4
pkgrel=1
pkgdesc="Ham Radio - An aid for POTA hunters"
url="https://pypi.org/project/augratin/"
depends=(python python-psutil python-requests python-pyqt5-webengine python-folium hamlib hamradio-menus)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=(GPL)
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
md5sums=('6f096f11c11c62a60bc144524ec63d9c')
sha256sums=('7f0094be3cef8988c6751a2f5b71db3825e1cb5f0d4c172fbba011c62f429112')
