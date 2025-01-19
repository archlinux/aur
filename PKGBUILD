# Maintained: Hoel Kervadec <hoel@kervadec.bzh>

pkgname=python-medpy
_appname=medpy
pkgver=0.5.2
pkgrel=1
pkgdesc='Medical image processing in Python'
arch=('x86_64')
url="https://loli.github.io/medpy"
license=('GPL')
depends=('python' 'python-numpy' 'python-scipy')
optdepends=('python-simpleitk')
makedepends=('python-setuptools' 'boost')
source=("https://github.com/loli/medpy/archive/$pkgver.tar.gz")
b2sums=('837a78e6116eff11140566a9da6703f28ce5eccb69f873d70099abef106ea06fd75ca9a23342a68f40632cbf985525d57f798a8ddc58a5e6fe702b1bafe3c5c3')

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
