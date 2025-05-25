# Maintainer: devome <evinedeng@hotmail.com>

pkgname="reader-server"
pkgver=3.2.14
pkgrel=1
pkgdesc="Book Reader Server | 阅读3服务器版"
arch=('any')
url="https://github.com/hectorqin/${pkgname%-*}"
license=('GPL-3.0-or-later')
backup=("etc/${pkgname}/${pkgname}.env" "etc/${pkgname}/application.properties")
depends=("java-runtime-headless>=8")
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('78fcc3cae13703b39c1e20f112a849f49aacdaf4f339da77e25ae391bfee8f23'
            '9c1993de3d0d23b7dcfdd7983f976010ce7ae1dcb4c779afd00563c7ab3cb248'
            '411a0c79d2180c4aa901da3766412a1485b0867d1a129f65cd5c4f07f0a0bd25'
            'e7d9a30b52e4e342f27e3cd3e98731729025ebefcd70e1e1a42c9863420bcbd3'
            '4a3fa6b192b80c4e10052634e8b0d9a5aabd9268014c09876b6228f403ac2d35')

package() {
    install -Dm644 "${pkgname}.env"              "${pkgdir}/etc/${pkgname}/${pkgname}.env"
    install -Dm644 "${pkgname}.service"          "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"         "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"         "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "conf/application.properties" "${pkgdir}/etc/${pkgname}/application.properties"
    install -Dm644 "target/"*.jar                "${pkgdir}/usr/share/java/${pkgname}.jar"
}
