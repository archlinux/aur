# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
pkgname=('teamtalk')
pkgver=5.2.1
pkgrel=1
        pkgdesc='a software conferencing system server which enables a group of people to collaborate and share information using voice and video'
arch=('x86_64')
        depends=('gcc-libs')
        install="${pkgname}.install"
backup=("etc/${pkgname}/tt5srv.xml")
license=('custom')
url='http://www.bearware.dk'
source=("http://bearware.dk/${pkgname}/v${pkgver}/${pkgname}-v${pkgver}-debian7-${arch}.tgz"
        "${pkgname}.install")
sha256sums=('4926548da8937f9f618fb97494ab41644406d03f6a9a33ae6abfdf83a0dbdf78'
            '621938e7a6b07988ff05a032ba098e5d7e8a10040c6dac3c1f3255ac89938a6e')

package() {

        install -D -m644 ${srcdir}/${pkgname}-v${pkgver}-debian7-${arch}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        install -D -m755 ${srcdir}/${pkgname}-v${pkgver}-debian7-${arch}/server/tt5srv ${pkgdir}/usr/bin/tt5srv
        install -D -m644 ${srcdir}/${pkgname}-v${pkgver}-debian7-${arch}/server/systemd/tt5server.service ${pkgdir}/usr/lib/systemd/system/tt5srv.service
}
