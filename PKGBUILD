# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pyqso
_authorname=ctjacobs
pkgver=1.1.0
pkgrel=2
pkgdesc="Ham Radio QSO logging tool."
arch=('any')
url="https://christianjacobs.uk/pyqso/"
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'python-basemap' 'python-cairocffi'
	'hamlib' 'hamradio-menus')
optdepends=('python-cartopy' 'python-geocoder')
#makedepends=('python-sphinx'	# for building docs)
source=(https://github.com/${_authorname}/$pkgname/archive/v${pkgver}.tar.gz
	$pkgname.desktop
)

build () {
	cd $srcdir/$pkgname-$pkgver

#	make docs
}

package() {
	cd $srcdir/$pkgname-$pkgver

	python3 setup.py install --root="$pkgdir/" --optimize=1

	install -Dm644 pyqso/res/log_14x14.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

#	mkdir -p $pkgdir/usr/share/$pkgname/docs/html/{_images,_modules/pyqso,_sources,_static}
#	cp -a docs/build/html/* $pkgdir/usr/share/$pkgname/docs/html/.
}
md5sums=('43eef19310ceaa540fea2c738a2b9e64'
         'db5223623f0a745b15798e18c1f5fc0d')
sha256sums=('b9af0497ccbb4e5f2281b45a1ed98d02c0c6a6878cd6da9d02e748a265164e26'
            'b724c3782338cd546f78719137802384364522e398fb6c5a633442d25a2afb17')
