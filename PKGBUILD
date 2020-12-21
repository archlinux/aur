# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pyinstaller-hooks-contrib
pkgver=2020.11
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL' 'APACHE')
depends=('towncrier' 'python-setuptools' 'python-wheel' 'twine')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fc3290a2ca337d1d58c579c223201360bfe74caed6454eaf5a2550b77dbda45c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
