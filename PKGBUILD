# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgname=3dprinter-udev-rules
pkgver=0.4
pkgrel=0
pkgdesc="Rules for udev to give regular users access to operate 3D printers."
url="https://github.com/hroncok/${pkgname}"
arch=('any')
license=('MIT-0')
depends=('systemd')
makedepends=('systemd')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "3dprinter-udev.install")
sha512sums=('ea05963ef5cf3a3eaf03c12e9cddbd1c7ef42d48836acac14e5a3e78d616d116819e6e7acef3f2d94388dce9f39ebac859e8e1d1261ac28cf25d1f5c28fdd56e'
            'ce2d4a2215cdafc07e3cf88325ae50babfe61e18b327f669577a1c20aa9756152492cfab41ffeb08f371da00b58935f8b74f7fd282f29c6376ac99fe84633f23')
install='3dprinter-udev.install'

package() {
  install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/66-3dprinter.rules" "${pkgdir}/usr/lib/udev/rules.d/"
  install -m755 -d "${pkgdir}/usr/share/doc/$pkgname"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/$pkgname/"
  install -m755 -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
