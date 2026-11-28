# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ublockdnsclient-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="System DNS client for uBlockDNS ad and tracker blocking"
arch=('x86_64' 'aarch64')
url="https://github.com/ugzv/ublockdnsclient"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ugzv/ublockdnsclient/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ublockdns-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ublockdns-linux-arm64")
sha256sums=('c348407bc76673adc18861ea3bb8119f280c1cd183bd22c399052eafca8405a6')
sha256sums_x86_64=('b4ca4e888854e1b7792bb82fb5a9b93aaab6668a378dca6840e0bfcfc84aa5b6')
sha256sums_aarch64=('b2baecfde25d13ace9cf4cb0ba0af385c41b08e3b69b9bfcc9209b9503b46f15')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ublockdns"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
