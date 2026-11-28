# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clip-mash-bin
pkgver=0.23.1
pkgrel=1
pkgdesc="Semi-automatically generate compilation videos"
arch=('x86_64')
url="https://github.com/soundchaser128/clip-mash"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/soundchaser128/clip-mash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clip-mash-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
sha256sums_x86_64=('663ce2b85e56e26aa168e80554d5afe6e67b061e126a05b02c1490f0ec896f71')

package() {
  install -Dm755 "clip-mash" "${pkgdir}/usr/bin/clip-mash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
