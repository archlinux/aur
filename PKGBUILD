# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=boundary-desktop
pkgver=2.2.0
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
b2sums=('7d86e66b2ed07df8e1dd0f2011a091b67c2076579e29f1c2e5d1539ee48ec4186bff4afba6b8e14cf542006a899e2058392e59711b46917b6855664a20742e20')

package() {

  msg2 "Extracting the data.tar.zst"
  tar -xf data.tar.zst -C "${pkgdir}/"

  # .deb has 775
  cd ${pkgdir}
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/*
  chmod 755 ${pkgdir}/usr/share/*
}
