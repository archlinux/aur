# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ignite
pkgname=python-pytorch-ignite
pkgver=0.1.2
pkgrel=1
pkgdesc="High-level library to help with training neural networks in PyTorch"
arch=('any')
url="https://pytorch.org/ignite"
license=('BSD')
depends=('python-pytorch')
conflicts=('python-pytorch-ignite-git')
makedepends=('python-setuptools')
source=("https://github.com/pytorch/ignite/archive/v${pkgver}.tar.gz")
sha256sums=('35a60d2a8f6d930dba8cbd88810fc6bf799b84eea5f1d990ccfb2a5764fc2571')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
