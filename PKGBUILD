# Maintained: Hoel Kervadec <hoel@kervadec.bzh>

pkgname=python-medpy
_appname=medpy
pkgver=0.4.0
pkgrel=1
pkgdesc='Medical image processing in Python'
arch=('x86_64')
url="https://loli.github.io/medpy"
license=('GPL')
depends=('python' 'python-numpy' 'python-scipy')
optdepends=('python-simpleitk')
makedepends=('python-setuptools' 'boost')
source=("https://github.com/loli/medpy/archive/$pkgver.tar.gz")
sha256sums=('2a309ad7aaf80c1a46a56a1e3b8f19b981313cf2011bc901cfc3020c9ffa720d')

prepare() {
	cd $srcdir/$_appname-$pkgver
}

build() {
	cd $srcdir/$_appname-$pkgver

	python setup.py build
}


package() {
	cd $srcdir/$_appname-$pkgver
	python setup.py install --root="$pkgdir/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
