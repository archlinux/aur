# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=pg_backup_ctl
pkgver=b11948d
pkgrel=1
pkgdesc='A shell script to manage PostgreSQL archiving and basebackups'
arch=('any')
url='https://github.com/credativ/pg_backup_ctl'
license=('BSD')
depends=('git')
source=("${pkgname}::git+https://github.com/credativ/pg_backup_ctl.git")
sha512sums=('SKIP')

pkgver() {
        cd ${srcdir}/${pkgname}
        git describe --always | sed 's|-|.|g'
}

package() {
  	cd ${srcdir}/${pkgname}
  	make install PREFIX=${pkgdir}/usr
}

