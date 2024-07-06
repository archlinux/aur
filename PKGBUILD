# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-rss-plugin"
pkgver=1.15.0
pkgrel=1
pkgdesc="MkDocs plugin to generate a RSS feeds for created and updated pages, using git log"
url="https://guts.github.io/mkdocs-rss-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-rss-plugin-git")
replaces=("python-mkdocs-rss-plugin-git")
depends=("mkdocs" "python-jinja" "python-gitpython")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Guts/mkdocs-rss-plugin/archive/refs/tags/$pkgver.tar.gz")
b2sums=('39ae348bb1b130afa95503323b5e77db1b2eb3ed1bbfa03dbf768b0985f5de48873ed76470ce7ffd4ce89bf8af7a8cb3b216f59614b0c066ef1955f6d96407e9')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
