# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-daemoniker
_name=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Cross-platform daemonization tools."
arch=('any')
url="https://daemoniker.readthedocs.io"
license=('Unlicense')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d9b62c8d75227b3da88c0ca22b82e19d88d32dade4ffa838427235e0cdd5e578')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
