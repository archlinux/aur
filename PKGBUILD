# Maintainer: lexa <contact@qexat.com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=babi-grammars
_pkgname=babi_grammars
pkgver=0.0.62
pkgrel=1
pkgdesc="Grammars for babi text editor"
arch=('any')
url="https://github.com/asottile/babi-grammars"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4f21a1223cb2016d9ee349435ccccc3160e94d252b7ab3047ac4f2212778fc68')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
