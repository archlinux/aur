# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ignite
pkgname=python-pytorch-ignite
pkgver=0.1.1
pkgrel=1
pkgdesc="High-level library to help with training neural networks in PyTorch"
arch=('any')
url="https://pytorch.org/ignite"
license=('BSD')
depends=('python-pytorch')
conflicts=('python-pytorch-ignite-git')
makedepends=('python-setuptools')
source=("https://github.com/pytorch/ignite/archive/v${pkgver}.tar.gz")
sha256sums=('182b94cd0f9c982e69a275d22461381b214f422ca5f79df412570d9acfd9b6da')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 ${srcdir}/$_pkgname-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
