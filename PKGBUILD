# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
pkgver=0.24.1
pkgrel=1
pkgdesc="SQL Operations Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW from Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/Microsoft/sqlopsstudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
optdepends=('krb5: Windows authentication support')
options=('staticlibs')
source=("http://download.microsoft.com/download/D/6/5/D655C5FA-52CB-4591-8D65-DEE04F05FF16/sqlops-linux-${pkgver}.tar.gz")
sha256sums=('e3d49c68cb8f0f9f1a23e6660349317970b27c9a31db6f16042d02dc854cf638')

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"

  install -m644 "${srcdir}/sqlops-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cp -r "${srcdir}/sqlops-linux-x64/"* "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/bin/sqlops "${pkgdir}/usr/bin/sqlops"
}
