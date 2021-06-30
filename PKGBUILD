# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-macros-plugin"
pkgver=0.5.12
pkgrel=1
pkgdesc="MkDocs plugin to use variables and macros in markdown files"
url="https://github.com/fralau/mkdocs_macros_plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-macros-plugin-git")
replaces=("python-mkdocs-macros-plugin-git")
depends=("mkdocs")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("15bcc06c1b954c1a7666c1b8493bc24cf20c8fd8d1d74d7c6edeb30011ad83e7")

build(){
 cd "${pkgname//-/_}-$pkgver"
 python setup.py build
}

package(){
 cd "${pkgname//-/_}-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
