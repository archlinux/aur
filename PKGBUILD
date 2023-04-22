# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=help2man
pkgname=python-$_pkgname
pkgver=0.0.9
pkgrel=2
pkgdesc="Convert --help and --version to man page."
arch=(any)
url=https://github.com/Freed-Wu/help2man
makedepends=(python-installer)
depends=(python-jinja)
provides=("$_pkgname")
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
source=(
	"$url/releases/download/$pkgver/help2man-$pkgver-py3-none-any.whl"
)
sha256sums=('36f6ec6c8a0130f85c36bd1e5dd2af34f8e60a46e5d4a271f769c9aaab6c6a1d')

package() {
	cd "$srcdir" || return 1
	python -m installer -d "$pkgdir" ./*.whl
}
