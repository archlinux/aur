# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Unofficial feature rich, responsive, modern client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/Vito0912/yaabsa"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('strip' '!libtool' '!staticlibs' '!emptydirs')
depends=('mpv' 'libsecret')
makedepends=('tar')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/Vito0912/yaabsa/releases/download/v${pkgver}/linux-deb-yaabsa_v${pkgver}.deb"
)

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  tar -xvf "${srcdir}"/data.tar.zst -C "${pkgdir}"
  ln -s "${pkgdir}/usr/share/${pkgname%-bin}/yaabsa" "${pkgdir}/usr/bin/yaabsa"
}

sha256sums=('b301f28c6cec355cebd64c309e323c8807b05b0aec8c6fa1aec45a9c9d388791')
