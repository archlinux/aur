# Maintainer: Andrew Anderson <andersan@tcd.ie>
pkgname=trinnity-compiler-git
pkgver=0.0.1
pkgrel=1
pkgdesc="The triNNity DNN compiler"
arch=('any')
url="https://bitbucket.org/STG-TCD/trinnity-compiler"
license=('BSD')
groups=()
depends=()
makedepends=('python')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://bitbucket.org/STG-TCD/trinnity-compiler")
sha512sums=("SKIP")

build() {
	cd trinnity-compiler/triNNity && python setup.py build
}

package() {
	cd trinnity-compiler/triNNity && python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	mkdir -p ${pkgdir}/usr/bin
	install -ma=rx ${srcdir}/triNNity-compiler ${pkgdir}/usr/bin
}

