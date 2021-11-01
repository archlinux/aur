# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

pkgname=python-cyaron
pkgver=0.4.3
_commit=825f2ff
pkgrel=1
pkgdesc="Random Olympic-informatics test data generator"
url="https://github.com/luogu-dev/cyaron"
license=('LGPL3')
arch=('any')
depends=('python-colorful' 'python-xeger')
makedepends=('python-setuptools' 'git')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('517E4E3C364C6C55C907284915AC252CE20E3FC8')

build() {
	cd "$pkgname"
	python setup.py build
}

check() {
	cd "$pkgname"
	python setup.py test
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
