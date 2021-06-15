# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-redirects-git"
pkgver=1.0.1.r14.g7c996a2
pkgrel=1
pkgdesc="Open source plugin for Mkdocs page redirects"
url="https://github.com/datarobot/mkdocs-redirects"
license=("MIT")
arch=("any")
provides=("python-mkdocs-redirects")
depends=("mkdocs")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-redirects"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build(){
 cd "mkdocs-redirects"
 python setup.py build
}

package(){
 cd "mkdocs-redirects"
 python setup.py install --root="$pkgdir" --optimize=1
}
