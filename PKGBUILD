# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=termux-language-server
pkgname="python-$_pkgname"
pkgver=0.0.2
pkgrel=1
pkgdesc="termux's build.sh language server"
arch=(any)
url=https://github.com/Freed-Wu/termux-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-beautifulsoup4)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('a3569c2f1589710cb23ecdb9dfe382bb68be38008ce4fb46e37769015d58dbb6')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
