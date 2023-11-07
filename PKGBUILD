# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Old Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

_pkgname=gnome-shell-extension-clipboard-indicator
pkgname=${_pkgname}-git
epoch=2
pkgver=v56.r0.g3744bed
pkgrel=1
pkgdesc="Adds a clipboard indicator to the top panel, and saves clipboard history"
arch=('any')
url="https://github.com/Tudmotu/${_pkgname}"
license=('MIT')
depends=('gnome-shell')
makedepends=('git')
conflicts=("${_pkgname}")
source=("git+https://github.com/Tudmotu/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  SR="${srcdir}/${_pkgname}"
  TG="${pkgdir}/usr/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com"
  TGDOC="${pkgdir}/usr/share/doc/gnome-clipboard-indicator-git"
  install -d ${TG}
  cp -fr ${SR}/* ${TG}
  install -d ${TGDOC}
  mv ${TG}/*.rst ${TGDOC}
}

