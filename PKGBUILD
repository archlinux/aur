# Contrinutor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>

pkgname=djvusmooth
pkgver=0.2.14
pkgrel=1
pkgdesc="A graphical editor for DjVu documents"
arch=('any')
url="http://jwilk.net/software/djvusmooth"
license=('GPL2')
depends=('python-djvulibre' 'pyxdg' 'wxpython2.8')
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('3c176ddb52069aa83b74b9ea098bda08')

build() {
	cd $pkgname-$pkgver
	sed -i 's:/usr/bin/python:&2:' $pkgname
	python2 setup.py build
}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root="$pkgdir"
}
