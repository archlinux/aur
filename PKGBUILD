# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=bitbake-language-server
pkgname="python-$_pkgname"
pkgver=0.0.7
pkgrel=1
pkgdesc="bitbake language server"
arch=(any)
url=https://github.com/Freed-Wu/bitbake-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-bitbake)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('94534a361e56fee037566d51f8f350263deac6a4b2e95f969d992baa68fe444f')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
