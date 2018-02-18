# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=DTLSSocket
pkgname=python-dtlssocket
pkgver=0.1.7
pkgrel=1
pkgdesc='Cython wrapper for tinydtls with a Socket like interface'
arch=('any')
url='https://git.fslab.de/jkonra2m/tinydtls-cython'
license=('EPL')
depends=('python' 'cython')
makedepends=('python-setuptools')
optdepends=()
source=( "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('1815c3f1d58a62ce93e044f9a0cd1b0e')

package() {
	cd "$srcdir/$_name-$pkgver"

	install -D -m644 "LICENSE" \
		             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	python setup.py install --optimize=1 --root=$pkgdir
}

