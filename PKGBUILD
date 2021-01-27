# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=15.0.4083.2
_prodver=${pkgver}-15
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver15"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/rhel/7/mssql-server-2019/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('c0cf46e8194f78937685a7f9cda00d9c19f3ba5c1d8a4553fec90398be492dc4')

install=$pkgname.install

package() {
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .
  chmod 644 $pkgdir/usr/lib/systemd/system/mssql-server.service
}
