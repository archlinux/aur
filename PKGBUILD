# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-material-extensions"
pkgver=1.2
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
sha256sums=('9948b8e2d5cfd6b1be91f5878462c0b5b7386d974e3d572e7078f4b6f86e916c')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
