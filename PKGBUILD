# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-imap-tools
pkgver=1.7.3
pkgrel=3
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
sha256sums=('fe0d2ab6548ba9bbde1f64f6192f65d0911e90fc70295bf00417972b5eac6b4b')

#check() {}
# WOuld require some setup

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*${pkgver}*.whl
}
