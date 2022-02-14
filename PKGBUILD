# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=boundary-desktop
pkgver=1.4.1
pkgrel=1
pkgdesc="Desktop Client for Boundary"
arch=('x86_64')
url="https://www.boundaryproject.io/"
license=('MPL-2.0')
depends=("gtk3" "libnotify" "nss" "libxtst" "xdg-utils" "at-spi2-core" "libdrm" "mesa" "libxcb" "gvfs" "glib2")
#FIXME: optdepends=("org.freedesktop.secrets")
# Recommends: pulseaudio | libasound2
# Suggests: gir1.2-gnomekeyring-1.0, libgnome-keyring0, lsb-release
source=("${pkgname}_${pkgver}_linux_amd64.deb::https://releases.hashicorp.com/boundary-desktop/${pkgver}/${pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=('94b574f0e7fca7350cc860f8e2b35ff3bf5fd1ab3bf3742947f5f229b418ea19')

package() {
  msg2 "Extracting the data.tar.xz"
  tar -xf data.tar.xz -C "${pkgdir}/"

  # .deb has 775
  cd ${pkgdir}
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/*
  chmod 755 ${pkgdir}/usr/share/*
}
