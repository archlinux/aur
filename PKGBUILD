# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=boundary-desktop
pkgver=2.0.3
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
b2sums=('7a6027ebcc23a50477aeb853e7dfe1e5f6a5795bfb5462d5c7025e7cf26d285bb0ec6369fdebda402d2d0033256c3d50af71c77a91783c91cc325369a70f2bbf')

package() {

  msg2 "Extracting the data.tar.zst"
  tar -xf data.tar.zst -C "${pkgdir}/"

  # .deb has 775
  cd ${pkgdir}
  chmod 755 ${pkgdir}/usr
  chmod 755 ${pkgdir}/usr/*
  chmod 755 ${pkgdir}/usr/share/*
}
