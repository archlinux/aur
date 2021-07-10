# Maintainer: Groctel <aur@taxorubio.com>

_name=Pyrr

pkgname=python-pyrr
pkgver=0.10.3
pkgrel=1
pkgdesc="Provides 3D mathematical functions using the power of NumPy."

arch=('any')
license=('BSD')
url="https://github.com/adamlwgriffiths/Pyrr"

source=("https://github.com/adamlwgriffiths/Pyrr/archive/${pkgver}.tar.gz")
sha512sums=('f3f045604e28f4a944ea0528363c233a75413a6039bd11b90eeeafadcaaf0ef44bc1303581f2e78adcfb9a365f719be64a24adf1cec8c5ef1abf5642dea58df4')

depends=(
	'python'
	'python-numpy'
	# AUR dependencies
	'python-multipledispatch'
)
makedepends=('python-setuptools')

package ()
{
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
