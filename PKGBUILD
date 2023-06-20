# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=pkgbuild-language-server
pkgname="python-$_pkgname"
pkgver=0.0.5
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
sha256sums=('b47914cdf401d22a9054f571b08c89f4814fd0c6351d877fb40b05916f0b7e56')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
