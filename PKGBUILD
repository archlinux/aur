# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=help2man
pkgname=python-$_pkgname
pkgver='0.0.5'
pkgrel=1
pkgdesc="Convert --help and --version to man page."
arch=(any)
url=https://github.com/Freed-Wu/help2man
makedepends=(python-installer)
depends=(python-jinja)
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('b333c05ca074878190f88720d0bb9cf9501cb52990a8a5a57c3b95fc55682f6e')

package() {
	cd "$srcdir" || return 1
	python -m installer -d "$pkgdir" ./*.whl
}
