# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-git-authors-plugin"
pkgver=0.10.0
pkgrel=2
pkgdesc="MkDocs plugin to display git authors of a page"
url="https://timvink.github.io/mkdocs-git-authors-plugin/"
license=("MIT")
arch=("any")
conflicts=("python-mkdocs-git-authors-plugin-git")
replaces=("python-mkdocs-git-authors-plugin-git")
depends=("python" "mkdocs" "git")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/timvink/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f1f3e3b079212ac78e2d5a749a944b626c4c49b2315a1ef0184238a5b7a33455b2ba6aabb50f4222a49d84369fcdf451345f9e80257485a8290aa627353460a8')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

