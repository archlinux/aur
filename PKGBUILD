# Maintainer: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rapidraw-bin
_pkgname=RapidRAW
pkgdesc="GPU-accelerated RAW image editor built with performance in mind"
pkgver=1.2.5
pkgrel=3
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
_debfile="${_pkgname}_v${pkgver}_ubuntu_amd64.deb"
source=("https://github.com/CyberTimon/${_pkgname}/releases/download/v${pkgver}/${_debfile}")
sha256sums=('c0ac41f079fd6a9a22e674a3578fa2ba5221f08980c08f5f7e149ae3041f3fba')

prepare() {
  bsdtar -xf data.tar.gz
  rm -f data.tar.gz control.tar.gz
}

package() {
  cp -ar "${srcdir}"/usr/. "${pkgdir}"/usr/
}
# vim:set ts=2 sw=2 et:
