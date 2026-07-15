# Maintainer: stsg

pkgname=express
pkgver=3.68.41
pkgrel=1
pkgdesc="Official Express App for Linux"
arch=('x86_64')
url="https://express.ms/download/deb"
license=('unknown')
depends=(
  gtk3
  libnotify
  nss
  libxss
  libxtst
  xdg-utils
  at-spi2-core
  util-linux-libs
  libsecret
)
optdepends=(
  libappindicator-gtk3
)
options=('!strip')
source=("https://updates.express.ms/desktop/eXpress_${pkgver}_amd64.deb")
sha256sums=('37afe738c3e7c5bc567089c80725e931b1482e9cfd2b5f92683cb53222fbe0d8')

package() {
  tar -xf data.tar.xz --directory "${pkgdir}"

  # Fix GTK version error for Gnome users
  sed -i 's|Exec="/opt/eXpress/express"|Exec="/opt/eXpress/express" --gtk-version=3|' "${pkgdir}/usr/share/applications/express.desktop"
}
