# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ccorn

pkgname="mkdocs-material-extensions-git"
pkgver=1.0.1.r2.ge2a379b
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-material-extensions-git")
replaces=("python-mkdocs-material-extensions-git")
depends=("mkdocs" "pymdown-extensions")
makedepends=("python-setuptools" "git")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-material-extensions"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-material-extensions"
 python setup.py build
}

package(){
 cd "mkdocs-material-extensions"
 python setup.py install --root="$pkgdir" --optimize=1
}
