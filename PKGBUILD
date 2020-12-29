# Maintainer: KikooDX <kikoodx@paranoici.org>
# Based on bashmount-git package maintened by caltlgin

_pkgname='cazy'
pkgname="${_pkgname}-git"
pkgver=r5.cabf574
pkgrel=1
pkgdesc='Tool to build and transfer Casio add-ins using gint and fxsdk.'
arch=('any')
url='https://gitea.planet-casio.com/KikooDX/cazy'
license=('0BSD')
depends=('bash')
makedepends=('git')
optdepends=('gint-devel-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
#backup=("etc/${_pkgname}.conf")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
