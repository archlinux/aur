# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-mermaid2-plugin-git"
pkgver=0.4.1.r18.gb3d5682
pkgrel=1
pkgdesc="A Mermaid graphs plugin for MkDocs"
url="https://github.com/fralau/mkdocs-mermaid2-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-mermaid2-plugin-git")
replaces=("python-mkdocs-mermaid2-plugin-git")
depends=("mkdocs" "python-jsbeautifier")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "${pkgname%-git}"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build(){
 cd "${pkgname%-git}"
 python setup.py build
}

package(){
 cd "${pkgname%-git}"
 python setup.py install --root="$pkgdir" --optimize=1
}
