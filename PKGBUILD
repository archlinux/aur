# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: duffydack <duffydack73 at gmail dot com>

pkgname="mkdocs-rss-plugin"
pkgver=1.17.5
pkgrel=1
pkgdesc="MkDocs plugin to generate a RSS feeds for created and updated pages, using git log"
url="https://guts.github.io/mkdocs-rss-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-rss-plugin-git")
replaces=("python-mkdocs-rss-plugin-git")
depends=("mkdocs" "python-jinja" "python-gitpython" "python-cachecontrol")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-setuptools-scm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Guts/mkdocs-rss-plugin/archive/refs/tags/$pkgver.tar.gz")
b2sums=('a984dfcf9565a929213617039379bbce0fd4c29a70968e1a262f9de7b57ebe5fc2194fcc3645e9eea3c782baedab48f68f14d862892ad89a5c30a34050d5d6d1')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
