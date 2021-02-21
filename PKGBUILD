# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-mkdocs-rss-plugin-git"
pkgver=0.12.0.r5.g6dbc3ad
pkgrel=1
pkgdesc="MkDocs plugin to generate a RSS feeds for created and updated pages, using git log"
url="https://guts.github.io/mkdocs-rss-plugin/"
license=("MIT")
arch=("any")
provides=("python-mkdocs-rss-plugin")
depends=("mkdocs" "git" "python-jinja" "python-gitpython")
makedepends=("python-setuptools" "python-wheel")
source=("git+https://github.com/Guts/mkdocs-rss-plugin/")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs-rss-plugin"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs-rss-plugin"
 python setup.py build
}

package(){
 cd "mkdocs-rss-plugin"
 python setup.py install --root="$pkgdir" --optimize=1
}
