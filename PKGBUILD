# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=rqlite
pkgver=5.0.0
pkgrel=2
pkgdesc="rqlite is a lightweight, distributed relational database, which uses SQLite as its storage engine"
arch=(x86_64)
url="http://www.rqlite.com/"
licence=('MIT')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.tar.gz"
        "rqlite.service")
sha256sums=('79eda823c82755977b998f5f9a33b738c32da932e41e08df2c0e500267644f83'
            'c74bc6b0eeadcdecb97236a5bc1ee4cd7312ac91067723dd935c5111e9bcb042')

package() {
    cd ${srcdir}/${pkgname}-v${pkgver}-linux-amd64/
    install -Dm 0755 rqlite ${pkgdir}/usr/bin/rqlite
    install -Dm 0755 rqbench ${pkgdir}/usr/bin/rqbench
    install -Dm 0755 rqlited ${pkgdir}/usr/bin/rqlited
    install -Dm 0644 rqlite.service ${pkgdir}/lib/systemd/system/rqlite.service
    install -dm 0750 -g rqlite -o rqlite ${pkgdir}/run/rqlite
    install -dm 0750 -g rqlite -o rqlite ${pkgdir}/etc/rqlite
}

