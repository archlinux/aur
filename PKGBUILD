# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-mermaid2-plugin-git"
pkgver=v0.4.1.r16.gb3d84d1
pkgrel=1
pkgdesc="A Mermaid graphs plugin for MkDocs"
url="https://github.com/fralau/mkdocs-mermaid2-plugin"
license=("MIT")
arch=("any")
provides=("python-mkdocs-mermaid2-plugin")
depends=("mkdocs" "python-jsbeautifier")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-mermaid2-plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-mermaid2-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-mermaid2-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
