# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=ledger-plots-git
pkgver=r72.910c280
pkgrel=1
pkgdesc="Tool to make plots for ledger"
arch=('i686' 'x86_64')
url="https://github.com/esovetkin/ledger-plots.git"
license=('GPL')
depends=('r')
makedepends=('git')
optdepends=('ledger: otherwise the script is useless')
provides=('ledger-plots')
replaces=()
backup=()
options=()
install="usage.install"
source=('git+https://github.com/esovetkin/ledger-plots.git')
noextract=()
md5sums=('SKIP')

_gitroot=git://github.com/esovetkin/ledger-plots
_gitname=ledger-plots

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  install -vDm755 ledger-plots "${pkgdir}/usr/bin/ledger-plots"
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
