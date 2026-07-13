# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.5.0
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


sha256sums=('13e3daaae2999286c4414029f9dd9812ecc601e8a00acf9b22db1566f8bc60a7')
