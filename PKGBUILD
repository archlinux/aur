# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=6
pkgrel=2
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
source=("https://github.com/moviuro/butter/archive/6.tar.gz")
sha256sums=('a4edd0c5a7ce24f243d06cf9cbbc1f615e55df2efdab8dcf0e9db1e4f8754f99')

package() {
  install -Dm 0555 "${srcdir}/${pkgname}-${pkgver}/butter" \
                   "${pkgdir}/usr/bin/butter"

  install -dm 0755 "${pkgdir}/usr/lib/butter"

  install -m  0444 "${srcdir}/${pkgname}-${pkgver}/lib-btr/"* \
                   "${pkgdir}/usr/lib/butter"
}
