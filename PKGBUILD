# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-userspacefs
_name=userspacefs
pkgver=1.0.13
pkgrel=3
pkgdesc="Cross-platform user-space file systems for Python"
arch=('any')
url="https://github.com/rianhunter/userspacefs"
license=('GPL3')
depends=('python-fusepyng')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5f4cffa4a40dbedc362544f2802d9806b3d435f8e615bb313c75f0eea528df4f')

build() {
	cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
