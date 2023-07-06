# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=pkgbuild-language-server
pkgname="python-$_pkgname"
pkgver=0.0.6
pkgrel=1
pkgdesc="PKGBUILD language server"
arch=(any)
url=https://github.com/Freed-Wu/pkgbuild-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-markdown-it-py pacman pyalpm namcap)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('db062b5028e93aa9304d2783cd73017320587ac64fc4d8c01f514ae1015a4bf0')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
