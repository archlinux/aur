# Maintainer: Arzet Ro <arzeth0@gmail.com>
pkgname=python-torchembed
pkgver=0.3.1
pkgrel=1
pkgdesc="A PyTorch library of modern embedding strategies missing from torch.nn"
depends=(python-pytorch)
makedepends=(python-build python-installer python-wheel)
optdepends=(
	'python-triton>=3.0: For GPU-accelerated kernels'
)
arch=('x86_64') # same as python-pytorch
url="https://github.com/liodon-ai/torchembed"
license=('MIT')
source=("https://github.com/liodon-ai/torchembed/archive/refs/tags/v$pkgver.tar.gz")
sha384sums=('af031975af9948cdda9a9886aa2c985720e059d74616367b35843882e925fe9e10f1da67013889401653ef68012a22f8')

build() {
	cd "${srcdir}/torchembed-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/torchembed-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
