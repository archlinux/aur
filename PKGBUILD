# Maintainer: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rapidraw-bin
_pkgname=RapidRAW
pkgdesc="GPU-accelerated RAW image editor built with performance in mind"
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
url=https://github.com/CyberTimon/RapidRAW
license=('AGPL-3.0-only')
provides=(rapidraw)
conflicts=(rapidraw)
depends=(
  webkit2gtk-4.1
  gtk3
  gcc-libs
  cairo
  glibc
  glib2
  gdk-pixbuf2
  openssl
  libsoup3
)
_ubuntuver=24.04
_debfile="03_${_pkgname}_v${pkgver}_ubuntu-${_ubuntuver}_amd64.deb"
#https://github.com/CyberTimon/RapidRAW/releases/download/v1.2.7/03_RapidRAW_v1.2.7_ubuntu-24.04_amd64.deb
source=("https://github.com/CyberTimon/${_pkgname}/releases/download/v${pkgver}/${_debfile}")
sha256sums=('6cde0d487eae78edafed91b1dfc3c3dc147ac1fe5c97f56d6208defbe4ebc791')

prepare() {
  bsdtar -xf data.tar.gz
  rm -f data.tar.gz control.tar.gz
}

package() {
  cp -ar "${srcdir}"/usr/. "${pkgdir}"/usr/
}
# vim:set ts=2 sw=2 et:
