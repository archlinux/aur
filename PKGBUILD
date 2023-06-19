# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=bitbake-language-server
pkgname="python-$_pkgname"
pkgver=0.0.1
pkgrel=1
pkgdesc="bitbake language server"
arch=(any)
url=https://github.com/Freed-Wu/bitbake-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-beautifulsoup4)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('19161c8ef7ae3c31767905a73dc7e60f810a5bff6dbd72455bba9245f5114bff')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
