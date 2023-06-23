# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=bitbake-language-server
pkgname="python-$_pkgname"
pkgver=0.0.3
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
sha256sums=('c62c7a075f8f01ecf197cc966b0069f7508c5a1c8c2e44781d607a7978f99f78')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
