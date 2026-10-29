# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-htmlproofer-plugin"
pkgver=1.6.0
pkgrel=2
pkgdesc="MkDocs plugin to validates URL in rendered html files"
url="https://github.com/manuzhang/mkdocs-htmlproofer-plugin"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-htmlproofer-plugin-git")
replaces=("python-mkdocs-htmlproofer-plugin-git")
depends=("python" "mkdocs" "python-beautifulsoup4" "python-requests")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('bd2ea10b99879575dc805bc92132fadcd0b6de38448e2117455041a7c70af0274c15e45347a56fe7c401ccf94f3a23f471704e47d45f75438586653e32552d9a')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
