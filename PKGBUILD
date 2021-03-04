# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-roamlinks-plugin-git"
pkgver=v_020.r6.gf038aad
pkgrel=1
pkgdesc="MkDocs plugin to automagically generate relative links between markdown pages"
url="https://github.com/Jackiexiao/mkdocs-roamlinks-plugin"
license=("MIT")
arch=("any")
provides=("python-mkdocs-roamlinks-plugin")
depends=("mkdocs")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-roamlinks-plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-roamlinks-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-roamlinks-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
