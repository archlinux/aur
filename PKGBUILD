# Maintainer:  moviuro <moviuro+archlinux@gmail.com>

pkgname=mkmm
pkgver=0.2.0
pkgrel=2
pkgdesc="Moviuro's Kernel Module Manager"
arch=('any')
license=('MIT')
url="https://git.sr.ht/~moviuro/${pkgname}"
install="${pkgname}.install"
validpgpkeys=('2CD96FEE343C6799B9CEAFAD62009A2E0C22D9AB')
# https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x62009A2E0C22D9AB
source=("git+${url}?signed#tag=${pkgver}"
        "${pkgname}.install")
sha256sums=('SKIP'
            '19066ac2fd8b1790b8f03b237596d98880149f2bcbd8bf328567e32f042d93b7')

package() {
  install -Dm 555 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/${pkgname}/"*hook
  install -Dm 444 "${srcdir}/${pkgname}/${pkgname}-bleach.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-bleach.service"
  install -Dm 444 "${srcdir}/${pkgname}/Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/Readme.md"
  install -dm 755 "${pkgdir}/usr/lib/${pkgname}"
}

