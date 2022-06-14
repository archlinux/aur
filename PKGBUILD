# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=rqlite
pkgver=7.5.1
pkgrel=1
pkgdesc="rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=(x86_64)
url="http://www.rqlite.com/"
licence=('MIT')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz"
        "${pkgname}.service"
        "${pkgname}@.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('6c334ae51e3fc5ee8442dd3d3138c25d73a4109b8eb4487a9555f67fe60000bd'
            'dada94e4161c48609567014e4ac48dc633437fd3a569ecf400e5c056b53dc3f9'
            '8c25f88104d9a1f2598a63f3e5ee7591d2579bf58aa4bbca38e3d69f5abf44db'
            'c0132b51d5c28517545fb58ce4aa67b6e860020d662aa8317ecb6aab0264829a'
            '43c1094a6fdd04c18df738fdc85250f0cbcb87b2f8f23320f42f4ca0656f43fc')

package() {
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/rqlite" "${pkgdir}/usr/bin/rqlite"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/rqbench" "${pkgdir}/usr/bin/rqbench"
    install -Dm755 "${srcdir}/${pkgname}-v${pkgver}-linux-amd64/rqlited" "${pkgdir}/usr/bin/rqlited"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

