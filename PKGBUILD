# Maintainer: Jeremiah Ticket <seashellpromises@gmail.com>
# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
pkgname=('teamtalk')
pkgver=5.15
pkgrel=1
        pkgdesc='a software conferencing system server which enables a group of people to collaborate and share information using voice and video'
arch=('x86_64')
        depends=('gcc-libs')
        install="${pkgname}.install"
backup=("etc/${pkgname}/tt5srv.xml")
license=('custom')
url='http://www.bearware.dk'
source=("https://bearware.dk/${pkgname}/v${pkgver}/${pkgname}-v${pkgver}-ubuntu22-${arch}.tgz"
        "${pkgname}.install")
sha256sums=('2ccf928b41cff2f611a6a7cde25db13d2cfd1bb1a7afa5d8b257f2f44a989418'
            '621938e7a6b07988ff05a032ba098e5d7e8a10040c6dac3c1f3255ac89938a6e')

package() {

        install -D -m644 ${srcdir}/${pkgname}-v${pkgver}-ubuntu22-${arch}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        install -D -m755 ${srcdir}/${pkgname}-v${pkgver}-ubuntu22-${arch}/server/tt5srv ${pkgdir}/usr/bin/tt5srv
        install -D -m644 ${srcdir}/${pkgname}-v${pkgver}-ubuntu22-${arch}/server/systemd/tt5server.service ${pkgdir}/usr/lib/systemd/system/tt5srv.service
}
