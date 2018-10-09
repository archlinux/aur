# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=ignite
pkgname=python-pytorch-ignite-git
pkgver=0.1.0.r39.g9e9d9b9
pkgrel=2
pkgdesc="High-level library to help with training neural networks in PyTorch"
arch=('any')
url="https://pytorch.org/ignite"
license=('BSD')
depends=('python-pytorch')
provides=('python-pytorch-ignite')
conflicts=('python-pytorch-ignite')
makedepends=('python-setuptools')
source=("git+https://github.com/pytorch/ignite.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | \
	  sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_pkgname"
	install -D -m644 ${srcdir}/$_pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
