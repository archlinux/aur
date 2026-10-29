# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-redirects"
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=2
pkgdesc="Open source plugin for Mkdocs page redirects"
url="https://github.com/datarobot/mkdocs-redirects"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-redirects-git")
replaces=("python-mkdocs-redirects-git")
depends=("python" "mkdocs>=1.1.1")
makedepends=("python-build" "python-installer" "python-hatchling" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('5e980330999299729a2d6a125347d1af78023d68a23681a4de3053ce7dfe2e51')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
