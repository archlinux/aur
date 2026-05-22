# Maintainer: erffy <https://codeberg.org/erffy>

pkgname=animecix-desktop
pkgver=0.1.23
pkgrel=2
pkgdesc="Animecix Desktop Application"
arch=('x86_64')
url="https://github.com/CaptainSP/animecix-desktop-2"
conflicts=('animecix-desktop')
provides=("animecix-desktop=$pkgver")
license=('MIT')
depends=('gtk3' 'desktop-file-utils' 'openssl' 'at-spi2-atk' 'libcurl-gnutls' 'libsm' 'nss' 'libxss' 'libnotify')
source=("animecix-${pkgver}.deb::${url}/releases/download/v${pkgver}/animecix_${pkgver}_amd64.deb")
sha256sums=('3b0d2287d89e65efe96a270a27034c27e4b27d7faadcdb671de4eeae7444be92')

prepare() {
  bsdtar -xf "animecix-${pkgver}.deb" data.tar.zst
  bsdtar -xf data.tar.zst
}

package() {
  cp -a usr "${pkgdir}/"

  chmod +x "${pkgdir}/usr/lib/animecix/AnimeciX"
  chmod +x "${pkgdir}/usr/bin/animecix"
}
