# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=rqlite
pkgver=5.1.0
pkgrel=2
pkgdesc="rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=(x86_64)
url="http://www.rqlite.com/"
licence=('MIT')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz"
        "${pkgname}.service"
        "${pkgname}@.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('540cda489049bcc85242e636950e82a7422fb207488253052aa93ab481cf3d84'
            '894ca04e9b699238841f69c131c772de8471c2ae42a13430e83730f4afd296c4'
            '3c759f9fab86ee41301f3c2772ae70fb4fac89e9080f0770cc6d5181c10c0b8c'
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

