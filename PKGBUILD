# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=torchsample
pkgname=python-$_pkgname
pkgver=0.1.3
pkgrel=1
pkgdesc="High-Level Training, Data Augmentation, and Utilities for Pytorch"
arch=('any')
url="https://github.com/ncullen93/torchsample"
license=('MIT')
depends=('python-pytorch' 'python-nibabel' 'python-tqdm' 'python-numpy' 'python-six')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/ncullen93/torchsample/archive/v${pkgver}.tar.gz")
sha512sums=('58c7fdcc6e39a7258fe1858899c4375d40e291e10b14e2f5f3529475a29ae2a884d13cef4e0c2247cf2a38973795e1e44769e3349420b82363eae95874ec7927')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
