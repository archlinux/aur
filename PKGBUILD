# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=1.4
pkgrel=4
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=('python-pytorch' 'python-torchvision' 'python-protobuf' 'python-six')
optdepends=('tensorboard: to visualise TensorBoard data')
makedepends=('python-setuptools')
source+=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bacf2825c8fb9c40bea22c50796fc4afe5bf11ff5f5c3b7ad7c933ad034b6fae')

package() {
	cd "$srcdir/$_name-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
