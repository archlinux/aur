# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
pkgname=('teamtalk')
pkgver=5.1.1
pkgrel=2
        pkgdesc='a software conferencing system server which enables a group of people to collaborate and share information using voice and video'
arch=('x86_64')
        depends=('gcc-libs')
        install="${pkgname}.install"
backup=("etc/${pkgname}/tt5srv.xml")
license=('custom')
url='http://www.bearware.dk'
source=("http://bearware.dk/${pkgname}/v${pkgver}/${pkgname}-v${pkgver}-centos7-${arch}.tgz"
        "tt5srv.service"
        "${pkgname}.install")
sha256sums=('8cbcd16fd7cc2df758726c78e22b55102bd8e9ab899dcdeb9aa38d6dd68cb36e'
            '285bf67b3f2448a5ab7a5c4b9a22482a563a8dc0c4259793be09bfefe84aad92'
            '621938e7a6b07988ff05a032ba098e5d7e8a10040c6dac3c1f3255ac89938a6e')

package() {

        install -D -m644 ${srcdir}/${pkgname}-v${pkgver}-centos7-${arch}/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
        install -D -m755 ${srcdir}/${pkgname}-v${pkgver}-centos7-${arch}/server/tt5srv ${pkgdir}/usr/bin/tt5srv
        install -D -m644 ${srcdir}/tt5srv.service ${pkgdir}/usr/lib/systemd/system/tt5srv.service
}
