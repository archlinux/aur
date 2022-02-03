# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=15.0.4198.2
_remRevision=10
_prodver=${pkgver}-${_remRevision}
pkgrel=3
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver15"
license=('unknown')
depends=('numactl' 'sssd' 'openssl-1.0>=1.0.2.l' 'libldap<=2.4.59')
source=("https://packages.microsoft.com/rhel/7/mssql-server-2019/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('04e8bb5dd43d4afdcbaca55819f24e962747c7d62f00e91bd7460a2763234fba')

install=$pkgname.install

package() {
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .
  chmod 644 $pkgdir/usr/lib/systemd/system/mssql-server.service
}
