# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-autodocsumm
pkgver=0.2.15
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
b2sums=('5fc1f4999976f05888ca76d97b2cbcc3f09739fea2f985e51e7292ae0b9f6b842445d7b2fd80846118f09ac3ed2bcc715e69c0550fd2fda46d1c63cef6b1b1be')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/autodocsumm-$pkgver-*.whl
}
