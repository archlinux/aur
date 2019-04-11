# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=gpio_pin_enable
pkgver=0.1
pkgrel=1
pkgdesc="Service for enabling/exporting gpio pins on boot."
arch=('any')
url="https://gitlab.com/craftyguy/gpio_pin_enable"
license=('GPL3')
depends=('python')
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=('etc/conf.d/gpio_pin_enable.conf')
source=("https://gitlab.com/craftyguy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('e57b3da2c4385fe48da63e32796fbba3df361abb3ec7bbc317ace052bb195cdecdc277a8ddc1d998e34ccfb5c7fe197838ca3087814303da1f19195a196ce24d')

package() {
        cd "${pkgname}-${pkgver}"
        install -m755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/conf.d/${pkgname}.conf" "${pkgdir}/etc/conf.d/${pkgname}.conf"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
