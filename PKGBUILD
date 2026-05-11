# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=boundary-desktop
pkgver=2.6.0
pkgrel=1
pkgdesc="Desktop Client for Boundary"
arch=('x86_64')
url="https://www.boundaryproject.io/"
license=('MPL-2.0')
depends=("gtk3" "libnotify" "nss" "libxtst" "xdg-utils" "at-spi2-core" "libdrm" "mesa" "libxcb" "gvfs" "glib2")
#FIXME: optdepends=("org.freedesktop.secrets")
# Recommends: pulseaudio | libasound2
# Suggests: gir1.2-gnomekeyring-1.0, libgnome-keyring0, lsb-release
source=("${pkgname}_${pkgver}_linux_amd64.deb::https://releases.hashicorp.com/boundary-desktop/${pkgver}/${pkgname}_${pkgver}_amd64.deb")
b2sums=('e91cd4d22c7fc10f5ab70dc48b8c8c20474aa8f31c6077cdeb66795fc0ac88e72c03b83c574c25b5297d6c3a7443b18ed8cb8b3a2425e7f341660d0c77d727ae')

package() {

  tar -xf data.tar.zst -C "${pkgdir}/"

  # .deb has 775
  cd ${pkgdir}
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/*
  chmod 755 ${pkgdir}/usr/share/*
}
