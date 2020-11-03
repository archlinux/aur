# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

_name=asks
pkgname=python-asks
pkgver=2.4.12
pkgrel=1
pkgdesc="Async requests-like httplib for python."
arch=('any')
url="https://github.com/theelous3/asks"
license=('MIT')
depends=('python-async_generator' 'python-h11' 'python-anyio')
optdepends=('python-trio: test use' 'python-curio: test use' 'python-pytest: test use' 'python-overly: test use')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('38de944eb350e7e4e3a918055fa8ff033da5f7b5ff385c1160a2d6b9d84783b0')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENCE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

