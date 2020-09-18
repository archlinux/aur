# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.5.2
pkgrel=2
pkgdesc='Helper utility to work with patches on a public-inbox'
license=('GPL')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
makedepends=('python-setuptools')
depends=('python-requests')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('72d5cf03e58a9c951f8fbc4e9634665d6af76caffbe964b8723199a5f30348f0')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
