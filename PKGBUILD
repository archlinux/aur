# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.9.0
pkgrel=2
pkgdesc="Unofficial feature rich, responsive, modern client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/Vito0912/yaabsa"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('strip' '!libtool' '!staticlibs' '!emptydirs')
depends=(
	'mpv'
	'libsecret'
	'gtk3'
	'hicolor-icon-theme'
)
makedepends=('tar')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/Vito0912/yaabsa/releases/download/v${pkgver}/linux-deb-yaabsa_v${pkgver}.deb"
)

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  tar -xvf "${srcdir}"/data.tar.zst -C "${pkgdir}"
  ln -s "${pkgdir}/usr/share/${pkgname%-bin}/yaabsa" "${pkgdir}/usr/bin/yaabsa"
}

sha256sums=('134fdc71b61c2c25e2140a7aed3daa4e7cc9b925437fa5caabd7b847307d74b9')
