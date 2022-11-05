# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ignite
pkgname=python-pytorch-ignite
pkgver=0.4.10
pkgrel=1
pkgdesc="High-level library to help with training neural networks in PyTorch"
arch=('any')
url="https://pytorch.org/ignite"
license=('BSD')
depends=(
    'python-packaging'
    'python-pytorch'
)
conflicts=('python-pytorch-ignite-git')
makedepends=('python-setuptools')
source=("https://github.com/pytorch/ignite/archive/v${pkgver}.tar.gz")
sha256sums=('4b03a1278f474198690bc833b5b924db6d2d31be0c05055639dc64e487c592ce')

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -D \
        -m644 \
        "${srcdir}/$_pkgname-$pkgver/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	python setup.py install --optimize=1 --root="$pkgdir"
}
