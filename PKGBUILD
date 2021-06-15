# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-macros-plugin-git"
pkgver=0.5.12.r0.g4bf847b
pkgrel=1
pkgdesc="MkDocs plugin to use variables and macros in markdown files"
url="https://github.com/fralau/mkdocs_macros_plugin"
license=("MIT")
arch=("any")
provides=("python-mkdocs-macros-plugin")
depends=("mkdocs")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs_macros_plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build(){
 cd "mkdocs_macros_plugin"
 python setup.py build
}

package(){
 cd "mkdocs_macros_plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
