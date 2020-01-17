# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-colorful
_name=colorful
pkgver=0.5.4
pkgrel=2
pkgdesc="Terminal string styling done right, in Python"
arch=('any')
url="https://github.com/timofurrer/colorful"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
")
sha256sums=('6800079a7bd4a3d17b4915b195267f80802703df8fe276565e5cedf7691807dd')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
