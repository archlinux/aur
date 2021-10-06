# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-pysigset
pkgver=0.4.0
pkgrel=1
pkgdesc="Python blocking/suspending signals under Linux/OSX using ctypes sigprocmask access"
arch=('any')
url="https://github.com/ossobv/pysigset"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('AD27E9B95AD1CD4DE4CC92BFE4C53075C170E20E') ## Walter Doekes (wdoekes)

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
