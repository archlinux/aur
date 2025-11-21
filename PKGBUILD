# Maintainer: Phillip K. Samuel < pintert3 at protonmail dot com >

pkgname=python-engineering-notation
_name=engineering-notation
pkgver=0.10.0
pkgrel=1
pkgdesc="Human-readable engineering notation"
arch=('any')
url="https://pypi.org/project/engineering-notation"
license=('MIT')
depends=('python')
optdepends=('python-numpy: support for numpy integer types')
makedepends=('python-installer')
source=("engineering_notation-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
	"LICENSE::https://raw.githubusercontent.com/slightlynybbled/engineering_notation/v${pkgver}/license.txt")
noextract=("engineering_notation-$pkgver-py3-none-any.whl")
sha256sums=('49ff22ba8377673c8cd5f45298b87c41946b5a84583806a4655760124e22c451'
            '416b2eca583dec4f95752742f8938b1f16f274c15dcd174567f8bab2016f2e48')

package() {
	python -m installer --destdir="$pkgdir" engineering_notation-$pkgver-py3-none-any.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
