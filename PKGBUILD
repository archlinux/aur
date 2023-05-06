# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Ryan Owens <RyanOwens at linux dot com>

pkgname=gnome-shell-extension-hibernate-status
_uuid='hibernate-status@dromi'
pkgver=1.11.1
pkgrel=3
pkgdesc="Gnome Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hibernate-status')
conflicts=('gnome-shell-extension-hibernate-status-git')
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('1269763e6d7301690033266f1183d72a5db7e43600652d415e3e88a72184ad4b')
b2sums=('af1b366f5a4a17070fdd235267bfa38d1484c53a70ddf8f0cad0be108f5ea6ed47b85e43e0f11ab2ff35cf24d69c47e287fc0387d6e771d12d7708e1fef13dbb')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
