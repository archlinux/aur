# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-git-authors-plugin"
pkgver=0.8.0
pkgrel=1
pkgdesc="MkDocs plugin to display git authors of a page"
url="https://timvink.github.io/mkdocs-git-authors-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-git-authors-plugin-git")
replaces=("python-mkdocs-git-authors-plugin-git")
depends=("mkdocs" "git")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/timvink/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('08c0eee392ef94caf30f176f5c8923b4e3c5d951a36348bbeec4396052ee492715b99aa4f8824348728296e5276747083340943bd21f7850abd0ccfb3a2bf12c')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

