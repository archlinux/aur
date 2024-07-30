# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-imap-tools
pkgver=1.7.1
pkgrel=2
pkgdesc="Work with email and mailbox by IMAP"
arch=('any')
url="https://github.com/ikvk/imap_tools"
license=('Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

#check() {}
# WOuld require some setup

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
