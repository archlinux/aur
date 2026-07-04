# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.4.9
pkgrel=1
pkgdesc="Unofficial feature rich, responsive, modern client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/Vito0912/yaabsa"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('mpv' 'libsecret')
makedepends=('tar')
source=(
    "${pkgname}-${pkgver}.deb::https://github.com/Vito0912/yaabsa/releases/download/v${pkgver}/linux-deb-yaabsa_v${pkgver}.deb"
)

package() {
  install -dm755 "$pkgdir/usr/bin/$pkgname"
  cd "${srcdir}"
  ar x "${srcdir}"/${pkgname}-${pkgver}.deb
  tar -xvf "${srcdir}"/data.tar.zst -C "${pkgdir}"
  ln -s "${pkgdir}/usr/share/${pkgname%-bin}/yaabsa" "${pkgdir}/usr/bin/yaabsa"
}

sha256sums=('3afaa10aad7350e9c11a8ade9030664f557a17855483f28e51c424c245f6de84')
