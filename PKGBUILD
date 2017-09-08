# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pyqso
_authorname=ctjacobs
pkgver=1.0.0
pkgrel=1
pkgdesc="Ham Radio QSO logging tool."
arch=('any')
url="http://christianjacobs.uk/pyqso/"
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'python-basemap' 'python-cairocffi'
	'hamlib-git-python3' 'hamradio-menus')
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
md5sums=('c99f1c43ad90fc1cd37857b63cdeadfe'
         'db5223623f0a745b15798e18c1f5fc0d')
sha256sums=('ec7859fb1a93c9466abd55cedc3aceb143a4eb63efbda5a8da8d19652b718740'
            'b724c3782338cd546f78719137802384364522e398fb6c5a633442d25a2afb17')
