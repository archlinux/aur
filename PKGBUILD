# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-material-extensions"
pkgver=1.3
pkgrel=1
pkgdesc="Markdown extension resources for MkDocs Material"
url="https://github.com/facelessuser/mkdocs-material-extensions"
license=("MIT")
arch=("any")
provides=("mkdocs-material-extensions")
conflicts=("python-mkdocs-material-extensions-git" "mkdocs-material-extensions-git")
replaces=("python-mkdocs-material-extensions-git" "mkdocs-material-extensions-git")
depends=("mkdocs" "pymdown-extensions")
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8d0de017c6c3df08fbe0d2fdc2a70f0fd9a3fc9cd397cf3206a897bf7cbd31cf')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
