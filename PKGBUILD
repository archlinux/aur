# shellcheck shell=bash disable=SC2034,SC2154
pkgname=portage
pkgver=3.0.48.1
pkgrel=1
pkgdesc="package management and distribution system for Gentoo"
arch=(any)
url=https://wiki.gentoo.org/wiki/Project:Portage
makedepends=(python-installer)
license=(GPL2)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('1704a8c76bb6c601a768bb790a5ea1274e91333ae3dace53980a0c63068ed574')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
