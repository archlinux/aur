# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=snapbak2
pkgver=0.1
pkgrel=1
pkgdesc="A very simple tarsnap frontend"
arch=('any')
url="https://git.sr.ht/~craftyguy/snapbak2"
license=('GPL3')
depends=('python' 'python-dateutil' 'tarsnap')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://git.sr.ht/~craftyguy/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('8ce15941ffb194b7f3ad0898ad04722c7dc3efad2f1c40dbca7a214185a5eddb910dd71771207fd673399d2a36d69e0e5ec61a0313f8c9c3ae6f1f5698f5edc9')

package() {
        cd "${pkgname}-${pkgver}"
        mkdir -p "${pkgdir}/usr/bin"
        install -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/systemd/snapbak2@.service" "${pkgdir}/usr/lib/systemd/system/snapbak2@.service"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/systemd/snapbak2-daily.timer" "${pkgdir}/usr/lib/systemd/system/snapbak2-daily.timer"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/systemd/snapbak2-weekly.timer" "${pkgdir}/usr/lib/systemd/system/snapbak2-weekly.timer"
        install -m644 -D "${srcdir}/${pkgname}-${pkgver}/systemd/snapbak2-monthly.timer" "${pkgdir}/usr/lib/systemd/system/snapbak2-monthly.timer"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
