# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=15.0.4043.16
_prodver=${pkgver}-4
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://www.microsoft.com/en-us/sql-server/sql-server-vnext-including-Linux"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/rhel/7/mssql-server-2019/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('a7de886a1eea8b7dd397752c8d3655043c5538ff760735cbee91d0ad47bd2c0c')

install=$pkgname.install

package() {
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .
  chmod 644 $pkgdir/usr/lib/systemd/system/mssql-server.service
}
