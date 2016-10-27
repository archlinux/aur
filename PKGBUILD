# Contributor: Devaev Maxim <mdevaev@gmail.com>
# Author: Devaev Maxim <mdevaev@gmail.com>


pkgname="python-valkit"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="Yet another Python validators"
arch=("any")
url="https://github.com/mdevaev/valkit"
license=("GPL")
depends=("python")
makedepends=("python-setuptools" "wget")


build() {
	cd $startdir/src
	if [ ! -d $pkgname-$pkgver ]; then
		msg "Downloading tag v$pkgver..."
		wget $url/archive/v$pkgver.tar.gz
		tar -xzf v$pkgver.tar.gz
	fi

	rm -rf $pkgname-build
	cp -r $pkgname-$pkgver $pkgname-build
	cd $pkgname-build

	python setup.py build
}

package() {
	cd $srcdir/valkit-$pkgver
	python setup.py install --root=$pkgdir
}
