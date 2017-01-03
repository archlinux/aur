# Maintainer: Francois Menning <f.menning@protonmail.com>

_pkgname=cleanerml
pkgname=cleanerml-git
pkgver=r483.c1ba548
pkgrel=1
pkgdesc='System cleaners written in CleanerML used by BleachBit.'
url='https://github.com/az0/cleanerml'
license=('GPL3')
source=('git://github.com/az0/cleanerml.git')
sha256sums=('SKIP')
arch=('any')
depends=('bleachbit')
conflicts=('cleanerml')
provides=('cleanerml')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share/bleachbit/cleaners"
  cp -r ${srcdir}/${_pkgname}/release/*.xml "${pkgdir}/usr/share/bleachbit/cleaners"

  # duplicate entries
  rm -rf "${pkgdir}/usr/share/bleachbit/cleaners/wine.xml"
}
