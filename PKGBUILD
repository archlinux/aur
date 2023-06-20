# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=pkgbuild-language-server
pkgname="python-$_pkgname"
pkgver=0.0.3
pkgrel=1
pkgdesc="PKGBUILD language server"
arch=(any)
url=https://github.com/Freed-Wu/pkgbuild-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-markdown-it-py pacman pyalpm)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('89dfd2355909bfac6fa1b6a4735e24f0d4e8651e9f1688b2ce7d71dcb14ab315')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
