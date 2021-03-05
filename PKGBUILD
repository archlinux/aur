# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-ezlinks-plugin-git"
pkgver=v_0.1.6.r0.g435a250
pkgrel=1
pkgdesc="MkDocs plugin to automagically generate relative links between markdown pages"
url="https://github.com/orbikm/mkdocs-ezlinks-plugin"
license=("MIT")
arch=("any")
provides=("python-mkdocs-ezlinks-plugin")
depends=("mkdocs")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-ezlinks-plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-ezlinks-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-ezlinks-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
