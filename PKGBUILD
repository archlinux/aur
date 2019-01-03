# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=python-scan-build
_name=scan-build
pkgver=2.0.15
pkgrel=1
pkgdesc="Clang's scan-build re-implementation in python"
arch=(any)
url="https://github.com/rizsotto/scan-build"
license=('GPL3')
makedepends=('python' 'python-setuptools')
depends=('python>=2.7' 'clang')
conflicts=()
provides=()
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('33ff671ca5a38f9a32539f897a6bc183')

package() {
	cd "$srcdir/$_name-$pkgver"
	mkdir -p ${pkgdir}
	python ./setup.py install --root=${pkgdir} --optimize=1
	mv ${pkgdir}/usr/bin/scan-build{,.py}
}
