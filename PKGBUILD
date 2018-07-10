# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=pyflatten
pkgname=python-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc='A utility for flattening nested data structures into an array'
arch=('any')
url='https://github.com/ericmjl/pyflatten'
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
optdepends=('python-autograd')
source+=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7af9f278c4a97b4702588ed90d823844c9858ec16212b2202c5ed77fa5d730bd')


package() {
	cd "$srcdir/$_name-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}

