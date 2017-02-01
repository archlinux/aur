# Maintainer: Aleksey Kamenskikh <aleksey.kamenskikh@gmail.com>
_prodname=msodbcsql
pkgname=${_prodname}-ubuntu
pkgver=13.1.3.0
_prodver=${pkgver}-1
pkgrel=1
pkgdesc="Microsoft SQL Server for Linux ODBC driver"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools"
license=('unknown')
depends=('unixodbc' 'libcurl-compat')
source=("https://packages.microsoft.com/ubuntu/16.04/prod/pool/main/m/${_prodname}/${_prodname}_${_prodver}_amd64.deb")
md5sums=('04e3ee22373389d0c94880c49ac8b675')
noextract=("${_prodname}_${_prodver}_amd64.deb")
install=$pkgname.install

package() {
  cd ${pkgdir}
  ar x ${srcdir}/${_prodname}_${_prodver}_amd64.deb
  tar xfJ data.tar.xz
  rm ${pkgdir}/control.tar.gz
  rm ${pkgdir}/data.tar.xz
  rm ${pkgdir}/debian-binary
  rm ${pkgdir}/_gpgorigin
}
