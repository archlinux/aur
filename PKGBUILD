# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname='python3-lxc'
pkgrel=1
pkgver=3.0.3
pkgdesc="Python3.x bindings for liblxc"
depends=('python3' 'lxc')
url="https://github.com/lxc/python3-lxc"
license=('LGPL2.1')
arch=('x86_64')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('e4e0b542db6021cd0bf0b16520ad3285')

build() {
	# for some reason package extracts with a double package name
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
