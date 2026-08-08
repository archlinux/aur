# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.8.0
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

sha256sums=('ac59430898e1c5d8673f1b9a406423a49659d6eec24e85dfe58ad81fb507e5f9')
