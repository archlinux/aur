# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ignite
pkgname=python-pytorch-ignite
pkgver=0.2.1
pkgrel=1
pkgdesc="High-level library to help with training neural networks in PyTorch"
arch=('any')
url="https://pytorch.org/ignite"
license=('BSD')
depends=('python-pytorch')
conflicts=('python-pytorch-ignite-git')
makedepends=('python-setuptools')
source=("https://github.com/pytorch/ignite/archive/v${pkgver}.tar.gz")
sha256sums=('d75716ae035356ca809b367b908fec2e1c277c905aa25910b06563d8869badb1')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 "${srcdir}/$_pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
