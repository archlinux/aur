# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=boundary-desktop
pkgver=2.3.2
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
b2sums=('8273e8431e90c490dcb66a8401c8f5b1417ad622c258dc9d467c7116dccb8711645d35f8367ddc56fc4c1222f1821794b82bb98dd186eb51fa4dcb532f18fe98')

package() {

  tar -xf data.tar.xz -C "${pkgdir}/"

  # .deb has 775
  cd ${pkgdir}
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/*
  chmod 755 ${pkgdir}/usr/share/*
}
