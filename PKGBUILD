# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ignite
pkgname=python-pytorch-ignite
pkgver=0.3.0
pkgrel=1
pkgdesc="High-level library to help with training neural networks in PyTorch"
arch=('any')
url="https://pytorch.org/ignite"
license=('BSD')
depends=('python-pytorch')
conflicts=('python-pytorch-ignite-git')
makedepends=('python-setuptools')
source=("https://github.com/pytorch/ignite/archive/v${pkgver}.tar.gz")
sha256sums=('a56a2c4d01553f84ca9a64fd825c07500d855bc511596f8e9af90d1b1a654533')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 "${srcdir}/$_pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
