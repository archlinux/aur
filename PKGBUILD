# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=patinae-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Fast, programmable molecular viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/zmactep/patinae"
license=('BSD-3-Clause')
depends=('fontconfig' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zmactep/patinae/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/patinae-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/patinae-linux-arm64.tar.gz")
sha256sums=('d1c8735df7645749dc7a8d19dfc98b1c10406920aa09ba38a532b3971ae18906')
sha256sums_x86_64=('b986bdb3dfd5efbf240b5e4c6c8e260678a9c9594e574491cf87d7451b2b9aa1')
sha256sums_aarch64=('4249db1899ea2fc3957d90500ff1b4ae708113962c1729985fa261bc19ef1962')

package() {
  install -Dm755 "patinae" "${pkgdir}/usr/bin/patinae"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
