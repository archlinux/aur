# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: duffydack <duffydack73 at gmail dot com>

pkgname="mkdocs-rss-plugin"
pkgver=1.17.4
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
b2sums=('e540d15e722c3465a724097a00ae07baf66d28e8511eb09a8ecb63b07d2f847e72cb3b294400711b05de6872cbf190493a4cf6357bcfd23c2acc86c53dae3a87')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
