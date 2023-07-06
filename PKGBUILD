# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=portage-language-server
pkgname="python-$_pkgname"
pkgver=0.0.2
pkgrel=1
pkgdesc="gentoo portage language server"
arch=(any)
url=https://github.com/Freed-Wu/portage-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-beautifulsoup4 portage)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('802c12a4f87e18b17bfa91013ccb6f07a3ca29dfaa062a6237518994395b40e3')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
