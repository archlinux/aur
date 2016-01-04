# Maintainer: Moviuro <moviuro+archlinux@gmail.com>

pkgname=butter
pkgver=6
pkgrel=1
pkgdesc="butter is a btrfs snapshot manager"
arch=('any')
license=('WTFPL')
url="https://github.com/moviuro/butter"
depends=('bash' 'btrfs-progs')
optdepends=('systemd: human-friendly escaped names')
source=("https://github.com/moviuro/butter/archive/6.tar.gz")
sha256sums=('a4edd0c5a7ce24f243d06cf9cbbc1f615e55df2efdab8dcf0e9db1e4f8754f99')

package() {
  cd "$pkgdir"

  install -Dm 0555 "${srcdir}/${pkgname}-${pkgver}/butter" \
                   "usr/bin/butter"

  install -dm 0755 "usr/lib/butter"
  install -m 0444 "${srcdir}/${pkgname}-${pkgver}/lib-btr/"* "usr/lib/butter"
}
