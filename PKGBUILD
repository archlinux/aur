# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Ryan Owens <RyanOwens at linux dot com>

pkgname=gnome-shell-extension-hibernate-status
_uuid='hibernate-status@dromi'
pkgver=1.12
pkgrel=1
pkgdesc="Gnome Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hibernate-status')
conflicts=('gnome-shell-extension-hibernate-status-git')
_commit=d11284d8e8ef38aaf178963fb950b8ee347451a7
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6a8f0df5632ffe1063385e8a22b4d71bef72948df87a76a0cd835a7e8787a3ff')
b2sums=('762c476650994b3539e7670afce24296ff4880c1d2488261c4f7e427d8e2f81485027029de047807b7f2cf3024e9d5f04a2276719a0d058a5619a0b0b13bc706')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
