# Maintainer: envolution
# Contributor: kdh8219 <kdh8219@monamo.dev>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=rapidraw-bin
_pkgname=RapidRAW
pkgdesc="GPU-accelerated RAW image editor built with performance in mind"
pkgver=1.3.2
pkgrel=1
arch=('x86_64' 'aarch64')
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
_debfile="03_${_pkgname}_v${pkgver}_ubuntu-${_ubuntuver}"
#https://github.com/CyberTimon/RapidRAW/releases/download/v1.2.7/03_RapidRAW_v1.2.7_ubuntu-24.04_amd64.deb
#https://github.com/CyberTimon/RapidRAW/releases/download/v1.3.1/03_RapidRAW_v1.3.1_ubuntu-24.04-arm_arm64.deb
source_x86_64=("https://github.com/CyberTimon/${_pkgname}/releases/download/v${pkgver}/${_debfile}_amd64.deb")
sha256sums_x86_64=('3898a66b6967876301d55dbca35b12cbfd864a797c20134f95f2ab8370f982ab')
sha256sums_aarch64=('b8864666876cf682770778982680b4f65db717f3ea22126d4d06ffae484f9251')
source_aarch64=("https://github.com/CyberTimon/${_pkgname}/releases/download/v${pkgver}/${_debfile}-arm_arm64.deb")

prepare() {
  bsdtar -xf data.tar.gz
  rm -f data.tar.gz control.tar.gz
}

package() {
  cp -ar "${srcdir}"/usr/. "${pkgdir}"/usr/
}
# vim:set ts=2 sw=2 et:
