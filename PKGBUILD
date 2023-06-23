# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=bitbake-language-server
pkgname="python-$_pkgname"
pkgver=0.0.2
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
sha256sums=('8f3829518ef7fa79d57fba503aa955ee7bd7716f368f44f85861bdc96dc80f18')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
