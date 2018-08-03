# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=skorch
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="A scikit-learn compatible neural network library that wraps pytorch"
arch=('any')
url="https://github.com/dnouri/skorch"
license=('BSD3')
depends=('python-scikit-learn' 'python-yaml' 'python-numpy' 'python-scipy' 'python-tqdm' 'python-pytorch' 'python-tabulate')
makedepends=('python-setuptools')
source=("https://github.com/dnouri/skorch/archive/v${pkgver}.tar.gz")
sha512sums=('b62275679d715f84dcf60bcd503bf1ad85e79b2982ddc2a8279c8fa0060122a5de3da044b5ece26d69d61af6923f0f4a9abab2ba9d15e60fbd65ed9818b89326')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
