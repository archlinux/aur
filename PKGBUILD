# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=9
pkgrel=2
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('custom:WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
backup=('etc/butterrc')
source=("https://github.com/moviuro/butter/archive/${pkgver}.tar.gz")
sha256sums=('1b850ffd989426dd2a2e2af3f66dab74f99bb9c1b37e0cad3f776cbac641d085')

package() {
  install -Dm 0555 "${srcdir}/${pkgname}-${pkgver}/butter" \
                   "${pkgdir}/usr/bin/butter"

  install -dm 0755 "${pkgdir}/usr/lib/butter"

  install -m  0444 "${srcdir}/${pkgname}-${pkgver}/lib-btr/"* \
                   "${pkgdir}/usr/lib/butter"

  install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/butterrc" \
                   "${pkgdir}/etc/butterrc"

  install -Dm 0444 "${srcdir}/${pkgname}-${pkgver}/butter.8" \
                   "${pkgdir}/usr/share/man/man8/butter.8"

  install -Dm 0444 "${srcdir}/${pkgname}-${pkgver}/butterrc.5" \
                   "${pkgdir}/usr/share/man/man5/butterrc.5"

  install -Dm 0444 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
