# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=1.5
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

_release_commit=27f8e6b5e409e02bce5ded8a12adb898916ae169

package() {
	cd "$srcdir/$_name"
	git checkout $_release_commit
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
