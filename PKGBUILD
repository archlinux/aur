# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='inplace_abn'
pkgname="python-pytorch-${_name}"
pkgver=1.0.12
pkgrel=1
pkgdesc="In-Place Activated BatchNorm for Memory-Optimized Training of DNNs (Pytorch)"
url="https://github.com/mapillary/${_name}"
depends=('python-pytorch' 'python-pillow' 'python-numpy' 'python-tensorboardx' 'python-torchvision')
makedepends=('python-setuptools')
license=('BSD')
arch=('x86_64')

source=("git+${url}.git#tag=v${pkgver}")
	
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}



