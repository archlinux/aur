# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pytradfri
pkgname=python-$_pkgname
pkgver=5.5.1
pkgrel=1
pkgdesc="Python class to communicate with the IKEA Trådfri Gateway"
arch=('any')
url="https://github.com/ggravlingen/pytradfri"
license=('MIT')
depends=('python' 'libcoap-dtls-git' 'python-dtlssocket')
makedepends=('python-setuptools')
source=("https://github.com/ggravlingen/pytradfri/archive/${pkgver}.tar.gz")
sha512sums=('b67a9c0abbd3f7b8a7b6a0eb61944903ac084a43855523c037da47fdd3d4f00ea326d74a01b0d78615e96fd40f40a082ce3d077a9df180aa0cccc2757f44f63c')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
