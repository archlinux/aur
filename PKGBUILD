# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: duffydack <duffydack73 at gmail dot com>

pkgname="mkdocs-rss-plugin"
pkgver=1.17.2
pkgrel=1
pkgdesc="MkDocs plugin to generate a RSS feeds for created and updated pages, using git log"
url="https://guts.github.io/mkdocs-rss-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-rss-plugin-git")
replaces=("python-mkdocs-rss-plugin-git")
depends=("mkdocs" "python-jinja" "python-gitpython" "python-cachecontrol")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Guts/mkdocs-rss-plugin/archive/refs/tags/$pkgver.tar.gz")
b2sums=('cd982bd7b3623d749c3442d3ad2a15ce404895a053e2b35a4f81c9ded52c141626237fa2cd63228d2b589dace0a41acc1a94f18cf79689406bff99070f893a67')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
