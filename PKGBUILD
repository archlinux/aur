# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-jinja2-filters-plugin-git"
pkgver=r2.01f18cb
pkgrel=1
pkgdesc="MkDocs plugin to use custom Jinja2 filters"
url="https://github.com/burnedikt/mkdocs-jinja2-filters-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-jinja2-filters-plugin-git")
replaces=("python-mkdocs-jinja2-filters-plugin-git")
depends=("mkdocs" "python-jinja")
makedepends=("python-setuptools")
source=("git+$url")
sha256sums=("SKIP")
install="plugin.install"

pkgver(){
 cd "mkdocs-jinja2-filters-plugin"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
 cd "mkdocs-jinja2-filters-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-jinja2-filters-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
