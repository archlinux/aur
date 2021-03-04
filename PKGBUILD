# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-htmlproofer-plugin-git"
pkgver=0.0.1.r19.g42a852f
pkgrel=1
pkgdesc="MkDocs plugin to validates URL in rendered html files"
url="https://github.com/manuzhang/mkdocs-htmlproofer-plugin"
license=("MIT")
arch=("any")
provides=("python-mkdocs-htmlproofer-plugin")
depends=("mkdocs" "python-beautifulsoup4" "python-requests")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-htmlproofer-plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-htmlproofer-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-htmlproofer-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
