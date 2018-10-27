# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=vtkInterface
pkgname=python-vtkinterface
pkgver=0.11.2
pkgrel=1
pkgdesc="VTK helper module that simplifies mesh creation and plotting"
arch=('any')
url="https://github.com/akaszynski/vtkInterface"
license=('MIT')
depends=('vtk' 'python-imageio')
makedepends=('python-setuptools')
source=("https://github.com/akaszynski/vtkInterface/archive/${pkgver}.tar.gz")
sha256sums=('0564529b3228571dee61926a05014dfa1643c082c050be99c3df950d58df1f07')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}
