# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Owner: Valentin Lab valentin.lab@kalysto.org

_pkgname=gitchangelog
pkgname=python-gitchangelog
pkgver=3.2.0
pkgrel=1
pkgdesc="Creates a changelog from git log history."
url="https://github.com/sarnold/gitchangelog"
license=("BSD")
depends=('python')
optdepends=('python-pystache')
makedepends=('git' 'python-setuptools' 'python-pip' 'python-wheel')
arch=("x86_64")
source=("git+https://github.com/sarnold/${_pkgname}#tag=${pkgver}")

build() {
	cd ${srcdir}/${_pkgname}
	python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha256sums=('32799a97f232967209caf4f80a9b06a7e75aca2c32640caa17a4a168a4a7e092')
