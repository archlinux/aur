# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-autodocsumm
pkgver=0.2.12
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
b2sums=('b5c73f152e0766f436937ff486f4bf2d3371325a92c3451d8b82a4186a7b9afdb7eb4f0f5b2186c8884a9b4fd082f2af3065ff85460bc2941ef261f7772f9627')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
