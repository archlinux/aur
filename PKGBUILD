# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>
# Maintainer: Sving1024 <sving1024@outlook.com>

_name=xeger
pkgname=python-xeger-bin
pkgver=0.4.0
pkgrel=3
pkgdesc="A library for generating random strings from a valid regular expression."
license=('BSD')
arch=('any')
url="https://github.com/crdoconnor/xeger"
depends=('python')
makedepends=('python-installer')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "LICENSE::$url/raw/master/LICENSE.txt")
conflicts=('python-xeger-git')
provides=('python-xeger')
sha256sums=('a0f544faf45ac56a29af4e628bd1e6996334f090458d78a61581490df1aad252'
            'eddc4d81d82f642e4a1bd9995666ca8fcf1aff8a59b2d4d20b173988d709d8a8')
package() {
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd $srcdir
    python -m installer --destdir="$pkgdir" ${_name//-/_}-$pkgver-py3-none-any.whl
}
