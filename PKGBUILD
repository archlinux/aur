# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-autodocsumm
pkgver=0.2.13
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
b2sums=('d0e8285a27fe63179903670a3845c06b6e3701a5947ad04871764457c7c056e98540191c397eff9918609941e7916fb30c88502ff57d28cb435e2d8aaced10a4')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
