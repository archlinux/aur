# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor:  Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh et:

pkgname=dialog-doc
_pkgname=dialog
pkgver=1.2_20130928
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="Samples for the dialog, a tool to display dialog boxes from shell scripts"
arch=('any')
url="http://invisible-island.net/dialog/"
license=('GPL')
depends=('sh' 'bash' 'dialog>=1.1_20110118')
source=(
ftp://invisible-island.net/${_pkgname}/${_pkgname}-$_pkgver.tgz
ftp://invisible-island.net/${_pkgname}/${_pkgname}-$_pkgver.tgz.asc
)
# ftp://invisible-island.net/dialog/

package() {
  cd "${srcdir}"/${_pkgname}-${_pkgver}/samples/

  install -dm755 ${pkgdir}/usr/share/doc/${_pkgname}/samples

  # search for executeables files
  find -maxdepth 1 -type f -perm +111 -print | \
    xargs -I{} cp {} ${pkgdir}/usr/share/doc/$_pkgname/samples/

  for i in README report-* setup-* testdata-8bit textbox.txt whiptail.rc \
    checklist9.txt; do
    install -Dm 644 $i ${pkgdir}/usr/share/doc/$_pkgname/samples
  done
}
sha256sums=('6fcf8daa50335e4d08da9f4f5ea5e1025efe84c3a719a56e871eb83ed0fd2b4c'
            'SKIP')
