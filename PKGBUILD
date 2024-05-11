# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-git-authors-plugin"
pkgver=0.9.0
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
b2sums=('babf9c6b200ee3ea6839e4b35c78e83c727477b9dbaee027fda49500d7b8bb57ffea2d960a2ca979ee8cb2e499a004dc49ca417c4a96054dad27408e4bbb0607')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

