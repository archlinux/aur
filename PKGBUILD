# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <piano5432@outlook.com>

# Author: Luogu Development Team <k@luogu.org> (https://github.com/luogu-dev)
# The copyright of this library belongs to Luogu (https://www.luogu.com.cn/).
# The library is released under LGPLv3.

_name=cyaron
pkgname=python-${_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="Random Olympic-informatics test data generator"
url="https://github.com/luogu-dev/cyaron"
license=('LGPL3')
arch=('any')
depends=('python' 'python-colorful' 'python-xeger')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=('517E4E3C364C6C55C907284915AC252CE20E3FC8')

build() {
	cd ${srcdir}/${_name}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/$_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
