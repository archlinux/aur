# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-macros-plugin"
_pkgname="$pkgname"
pkgver=1.5.0
_sdist=mkdocs_macros_plugin
pkgrel=1
pkgdesc="MkDocs plugin to use variables and macros in markdown files"
url="https://github.com/fralau/mkdocs_macros_plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-macros-plugin-git")
replaces=("python-mkdocs-macros-plugin-git")
depends=("mkdocs" "python-jinja" "python-termcolor" "python-yaml" "python-dateutil")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_sdist::1}/${_sdist}/${_sdist}-${pkgver}.tar.gz")
b2sums=('05bc8f9f61553536a85b80cf80eb4810ae123792fd55d628f69179c7fac9dd30d1bbcf47f4c3c0514020f0d4e0a212e0c5c346900c0756901387c371e0e0cd30')

build(){
 cd "${_sdist}-${pkgver}"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_sdist}-${pkgver}"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
