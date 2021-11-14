# Maintainer: DoctorZeus(Dan) <contact@techtonicsoftware.com>
# Contributor: Gabriel Morrison Lima Dantas <gabrielmldantas@gmail.com>
# Contributor: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
pkgname=mssql-server
pkgver=15.0.4178.1
_prodver=${pkgver}-3
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver15"
license=('unknown')
depends=(python2-configparser numactl sssd 'openssl-1.0>=1.0.2.l')
source=("https://packages.microsoft.com/rhel/7/mssql-server-2019/${pkgname}-${_prodver}.x86_64.rpm")

sha256sums=('7b3f20cd98cdf18369413fa06856da71b5ae71f5c82198fd2ab08cb765c9a083')

install=$pkgname.install

package() {
  cd $pkgdir
  mv $srcdir/opt .
  mv $srcdir/usr .
  chmod 644 $pkgdir/usr/lib/systemd/system/mssql-server.service
}
