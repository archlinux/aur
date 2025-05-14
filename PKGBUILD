# Maintainer: pudgala

pkgname=jookdb
provides=('jookdb')
pkgver=7.3
pkgrel=1
pkgdesc='Free universal database manager for MySQL, MariaDB, Oracle, PostgreSQL, DB2, SQLite, MongoDB, Redis, DM, OceanBase, Kingbase, TiDB and SQLServer'
arch=('x86_64')
url='https://jookdb.com/'
license=('unknown')
options=(!strip)
# https://jookdb.com/download/jookdb_7.3_linux_x64.AppImage
source=("${pkgname}_${pkgver}_linux_x64.AppImage::https://jookdb.com/download/${pkgname}_${pkgver}_linux_x64.AppImage")
noextract=("${pkgname}_${pkgver}_linux_x64.AppImage")
sha512sums=('df50d5ce4f482ca7a805fcd529b83cbce0574aed2e7cacb39c22e205b9003239c5b3c39e8018eef647968baa15b56d0c4e5c04414fd0a9d11c09eee52ba4116d')

package() {
    install -Dm755 "${srcdir}/${pkgname}_${pkgver}_linux_x64.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

