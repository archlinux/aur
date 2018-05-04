# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=skorch
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=1
pkgdesc="A scikit-learn compatible neural network library that wraps pytorch"
arch=('any')
url="https://github.com/dnouri/skorch"
license=('BSD3')
depends=('python-scikit-learn' 'python-yaml' 'python-numpy' 'python-scipy' 'python-tqdm' 'python-pytorch' 'python-tabulate')
makedepends=('python-setuptools')
source=("https://github.com/dnouri/skorch/archive/v${pkgver}.tar.gz")
sha512sums=('44e05ad89f86aeb4bfdfdb8039b67a20661cd4abd486d34c6de99e1c1d5dd83ac0bfd84a0b5d4a81840a352e952d4c32ecb2eef9e5d7efef3de369ba37d21c97')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
