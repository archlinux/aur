# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-htmlproofer-plugin"
pkgver=0.10.0
pkgrel=2
pkgdesc="MkDocs plugin to validates URL in rendered html files"
url="https://github.com/manuzhang/mkdocs-htmlproofer-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-htmlproofer-plugin-git")
replaces=("python-mkdocs-htmlproofer-plugin-git")
depends=("mkdocs" "python-beautifulsoup4" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1eb19086d5491cb32083993eeb12786629447feb14f1b123483351a2c9e21b34')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
