# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-material-extensions"
pkgver=1.3.1
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
b2sums=('b362a10ab5e0409044306422fc61edcd6fbba11742c8eb1c1a45f999952907b4c56003b7811ea764a2083d782a96fcf1f1e742e5b97e2540015e1a1ec002cfc6')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
