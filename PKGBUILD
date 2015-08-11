# Maintainer: Diogo Leal <estranho@diogoleal.com>

pkgname=automysqlbackup
pkgver=3.0_rc6
pkgrel=3
pkgdesc='Automatic daily/weekly/monthly MySQL backup script'
arch=('any')
url='http://sourceforge.net/projects/automysqlbackup/'
license=('GPL')
depends=('mariadb-clients')
install="${pkgname}.install"
backup=("etc/${pkgname}/${pkgname}.conf")
source=("automysqlbackup-v${pkgver}.tar.gz"::"http://sourceforge.net/projects/automysqlbackup/files/AutoMySQLBackup/AutoMySQLBackup%20VER%203.0/automysqlbackup-v${pkgver}.tar.gz/download")
sha256sums=('889e064d086b077e213da11e937ea7242a289f9217652b9051c157830dc23cc0')

package() {
    cd ${srcdir}/
    install -d ${pkgdir}/etc/${pkgname} ${pkgdir}/usr/bin ${pkgdir}/var/backup/db
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/${pkgname}/${pkgname}.conf
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
