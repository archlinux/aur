# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=skorch
pkgname=python-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc="A scikit-learn compatible neural network library that wraps pytorch"
arch=('any')
url="https://github.com/skorch-dev/skorch"
license=('BSD3')
depends=('python-scikit-learn' 'python-yaml' 'python-numpy' 'python-scipy' 'python-tqdm' 'python-pytorch' 'python-tabulate')
makedepends=('python-setuptools')
source=("https://github.com/skorch-dev/skorch/archive/v${pkgver}.tar.gz")
sha256sums=('cc27b2105e506bc44bbcc2ec20fd18cb0b9f0d118c3296f9f25797e355b532e0')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
