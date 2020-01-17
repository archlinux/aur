# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: awh
pkgname=python-pytweening
_name=PyTweening
pkgver=1.0.3
pkgrel=2
pkgdesc="A set of tweening / easing functions implemented in Python."
arch=('any')
url="https://github.com/asweigart/pytweening"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha256sums=('4b608a570f4dccf2201e898f643c2a12372eb1d71a3dbc7e778771b603ca248b')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
