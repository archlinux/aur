# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-macros-plugin"
_pkgname="$pkgname"
pkgver=1.0.5
pkgrel=1
pkgdesc="MkDocs plugin to use variables and macros in markdown files"
url="https://github.com/fralau/mkdocs_macros_plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-macros-plugin-git")
replaces=("python-mkdocs-macros-plugin-git")
depends=("mkdocs" "python-jinja" "python-termcolor" "python-yaml" "python-dateutil")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('f984cced060f09060bd63c7c204799dd9b318fa98229b2a86b034165190a76ccac7c8d37bf084c56ba0673105a818c0a0d210121d01e6b677349488aa0730160')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
