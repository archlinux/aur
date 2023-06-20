# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=pkgbuild-language-server
pkgname="python-$_pkgname"
pkgver=0.0.1
pkgrel=2
pkgdesc="PKGBUILD language server"
arch=(any)
url=https://github.com/Freed-Wu/pkgbuild-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-markdown-it-py pacman)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('1cfeee181f57fdcc302da4b47872740b48afb55e4ef1f45c685d432007d74e5d')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
