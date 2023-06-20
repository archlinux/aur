# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=termux-language-server
pkgname="python-$_pkgname"
pkgver=0.0.1
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
sha256sums=('28a4f447f8d425736dc10c2d02b35f2ebc88562ee29133943a7abd044ee3b6a2')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
