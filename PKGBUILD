# Maintainer:  moviuro <moviuro+archlinux@gmail.com>

pkgname=mkmm
pkgver=0.1.1
pkgrel=1
pkgdesc="Moviuro's Kernel Module Manager"
arch=('any')
license=('MIT')
url="https://git.sr.ht/~moviuro/${pkgname}"
validpgpkeys=('2CD96FEE343C6799B9CEAFAD62009A2E0C22D9AB')
source=("git+${url}?signed#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  install -Dm 555 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/${pkgname}/"*hook
  install -Dm 444 "${srcdir}/${pkgname}/${pkgname}-bleach.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-bleach.service"
}

