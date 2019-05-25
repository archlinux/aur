# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Owner: Valentin Lab valentin.lab@kalysto.org

_pkgname=gitchangelog
pkgname=python-gitchangelog
pkgver=3.0.4
pkgrel=1
pkgdesc="Creates a changelog from git log history."
url="https://github.com/vaab/gitchangelog"
license=("BSD")
depends=('python')
makedepends=('python-setuptools')
arch=("x86_64")
source=("git+https://github.com/vaab/${_pkgname}#tag=${pkgver}")

build() {
	cd ${srcdir}/${_pkgname}
	python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

md5sums=('SKIP')
