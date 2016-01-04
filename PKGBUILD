# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=7
pkgrel=1
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
source=("https://github.com/moviuro/butter/archive/${pkgver}.tar.gz")
sha256sums=('695af256c652879547497c758349c292c83a531708e8ca8c57eb4082b1fe4682')

package() {
  install -Dm 0555 "${srcdir}/${pkgname}-${pkgver}/butter" \
                   "${pkgdir}/usr/bin/butter"

  install -dm 0755 "${pkgdir}/usr/lib/butter"

  install -m  0444 "${srcdir}/${pkgname}-${pkgver}/lib-btr/"* \
                   "${pkgdir}/usr/lib/butter"

  install -dm 0755 "${pkgdir}/usr/share/man/man8"

  install -m  0444 "${srcdir}/${pkgname}-${pkgver}/butter.8" \
                   "${pkgdir}/usr/share/man/man8"
}
