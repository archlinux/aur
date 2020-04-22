# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pypsdd
_gitname="pypsdd"
pkgver=0.1
pkgrel=1
pkgdesc="The Python Probabilistic Sentential Decision Diagrams (PSDD) Package."
arch=('any')
url="https://github.com/art-ai/pypsdd"
license=('Apache 2.0')
depends=('python')
optdepends=('pypy3')
makedepends=('git')
source=("git+https://github.com/RenatoGeh/pypsdd")
sha256sums=('SKIP')

prepare() {
  cd "$_gitname"
  git checkout dev
  git pull
}

build() {
  cd "$_gitname"
  python3 setup.py build
}

package() {
  cd "$_gitname"
  python3 setup.py install --root="$pkgdir" --optimize=2 --skip-build
}

