# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=NiftyNet
pkgname=python-niftynet
pkgver=0.2.2
pkgrel=2
pkgdesc='An open-source CNNs platform for research in medical image analysis'
arch=('x86_64')
url='http://niftynet.io/'
license=('apache')
depends=('python-tensorflow' 'python-six>=1.10' 'python-nibabel>=2.1.0' 'python-numpy>=1.12' 'python-scipy>=0.18' 'python-pandas' 'python-pillow' 'python-blinker')
makedepends=('python-setuptools')
optdepends=()
source=("git+https://github.com/NifTK/NiftyNet.git")
md5sums=('SKIP')

_release_commit='1822a775dec30fcd1a3f5debaa537a6bd18d772f'

package() {
	cd "$srcdir/$_pkgname"
	git checkout $_release_commit
	python setup.py install --optimize=1 --root="$pkgdir"
}

