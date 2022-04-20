# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
pkgname=wdpass
_commit=7330684f16da516150d25f1a1323bb34b5ae93f6
pkgver=0.0.4
pkgrel=1
pkgdesc='WD Passport Ultra Complete Utilities for Linux'
arch=('any')
url='https://github.com/7aman/wdpass'
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'lsscsi' 'python-py3_sg')
source=("$pkgname.zip::https://github.com/7aman/wdpass/archive/$_commit.zip")
sha256sums=('01e566aae2f7b5bbb652912e409c61dd8c883ea825995092ab5125b073397d77')
b2sums=('ded6816aeeedf9e1462677f2264eef0cdd806c0dde862ab9234bc44d03c9c599bb01a46a17f79ab678acf59089f897476742ff2b14feebc0eebc3e86c29c67cd')

build() {
	cd "${srcdir}/${pkgname}-${_commit}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${_commit}"
	python setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
}
