# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=1.7
pkgrel=1
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=('python-protobuf' 'python-six')
makedepends=('python-setuptools' 'git')
conflicts=('python-tensorboard-git')
source+=("git+https://github.com/lanpa/tensorboardX.git")
sha256sums=('SKIP')

_release_commit=3a4c848ca850015ef5b2c7184dbe65da4eb674f4

package() {
	cd "$srcdir/$_name"
	git checkout $_release_commit
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
