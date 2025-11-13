# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: duffydack <duffydack73 at gmail dot com>

pkgname="mkdocs-rss-plugin"
pkgver=1.17.6
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
b2sums=('8218c5dae492d64bd66dbcf23c3b4292a20a1d16834b06ce5ea81c0c06cdb0f4fbc4d65571ed71151cf5c224d9560f1785983d8e90a1567673112336abbc7389')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
