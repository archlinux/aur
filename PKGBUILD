# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=rqlite
pkgver=5.0.0
pkgrel=3
pkgdesc="rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=(x86_64)
url="http://www.rqlite.com/"
licence=('MIT')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('79eda823c82755977b998f5f9a33b738c32da932e41e08df2c0e500267644f83'
            'c74bc6b0eeadcdecb97236a5bc1ee4cd7312ac91067723dd935c5111e9bcb042'
            'c0132b51d5c28517545fb58ce4aa67b6e860020d662aa8317ecb6aab0264829a'
            '43c1094a6fdd04c18df738fdc85250f0cbcb87b2f8f23320f42f4ca0656f43fc')

package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/rqlite" "${pkgdir}/usr/bin/rqlite"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/rqbench" "${pkgdir}/usr/bin/rqbench"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/rqlited" "${pkgdir}/usr/bin/rqlited"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

