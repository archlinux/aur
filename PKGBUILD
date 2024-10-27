# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-autodocsumm
pkgver=0.2.14
pkgrel=1
pkgdesc='Extending your autodoc API docs with a summary'
arch=('any')
url='https://github.com/Chilipp/autodocsumm'
license=('Apache')
depends=(
  'python'
  'python-docutils'
  'python-sphinx'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-versioneer'
)
_commit='7009e5ec0de58ac2675269829ca602447113d6e2'
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('c0346df7aecefdb26ec0dc90863781cd790a35c2bacbcf6c915aafa1ec410c1f7753074e67cf21bc2f3bd33fe5958fe3ec4992a98fae140604b6a6f7c7b54d88')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/autodocsumm-$pkgver-*.whl
}
