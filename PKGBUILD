# Maintainerr: TransistorLogic <liuhongwu2003@outlook.com>

pkgname=python-xeger
_name=xeger
pkgver=0.3.5
pkgrel=1
pkgdesc="A library for generating random strings from a valid regular expression."
url="https://github.com/crdoconnor/xeger"
depends=('python' )
makedepends=('python-setuptools' )
license=('BSD')
arch=('any')
#source=('https://files.pythonhosted.org/packages/f0/53/1de8409bb6171a302e00c79552f165ea3512fbc8c49ac80425e1fc9a711d/xeger-0.3.5.tar.gz')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('e2d003866279eecc9f7f24fff411e6df')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

#	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

#build() {
#    cd $srcdir/xeger-0.3.5
#    python setup.py build
#}
#
#package() {
#    cd $srcdir/xeger-0.3.5
#    python setup.py install --root="$pkgdir" --optimize=1 
#}
