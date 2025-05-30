# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: duffydack <duffydack73 at gmail dot com>

pkgname="mkdocs-rss-plugin"
pkgver=1.17.3
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
b2sums=('9bd80853b7f5391c6db7f8195f4ffbc442d81034e112ed1488aff97a91e4ec33253e6a06dd89c762a3dfb5ef11285b31ac3a6a1a58ddb7149a7543d7d2243a30')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
