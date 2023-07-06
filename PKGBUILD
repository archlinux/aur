# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=bitbake-language-server
pkgname="python-$_pkgname"
pkgver=0.0.4
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
sha256sums=('dabdb67b7e7f2959e68da2fb0c07f229a7b73acb3c6ecbaa66529c51d7a1c69f')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
