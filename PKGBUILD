# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-git-authors-plugin-git"
pkgver=v0.3.3.r0.ge7856bb
pkgrel=1
pkgdesc="MkDocs plugin to display git authors of a page"
url="https://timvink.github.io/mkdocs-git-authors-plugin/"
license=("MIT")
arch=("any")
provides=("python-mkdocs-git-authors-plugin")
depends=("mkdocs")
makedepends=("python-setuptools" "python-wheel")
source=("git+https://github.com/timvink/mkdocs-git-authors-plugin.git")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-git-authors-plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-git-authors-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-git-authors-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
