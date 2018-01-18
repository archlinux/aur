# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
pkgver=0.25.4
pkgrel=1
pkgdesc="SQL Operations Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW from Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/Microsoft/sqlopsstudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
optdepends=('krb5: Windows authentication support')
options=('staticlibs')
source=("https://github.com/Microsoft/sqlopsstudio/releases/download/${pkgver}/sqlops-linux-${pkgver}.tar.gz")
sha256sums=('af259da7df87ddd376296aca5a6b174289e02d2737d248ad28cd8a7123316562')

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"

  install -m644 "${srcdir}/sqlops-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cp -r "${srcdir}/sqlops-linux-x64/"* "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/bin/sqlops "${pkgdir}/usr/bin/sqlops"
}
