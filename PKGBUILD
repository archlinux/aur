# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=sqlops
pkgver=0.23.6
pkgrel=2
pkgdesc="SQL Operations Studio is a data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW from Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/Microsoft/sqlopsstudio"
license=('custom: microsoft')
depends=('fontconfig' 'libxtst' 'gtk2' 'python' 'cairo' 'alsa-lib' 'nss' 'gcc-libs' 'glibc' 'libxss' 'gconf' 'libxkbfile' 'libunwind' 'libsecret' 'curl')
optdepends=('krb5: Windows authentication support')
options=('staticlibs')
source=("http://download.microsoft.com/download/4/E/B/4EB84B63-4532-40D4-A1CD-8FD5772971CF/sqlops-linux-${pkgver}.tar.gz")
sha256sums=('854039f310171005e1e78a7aac9751803374926d60b7c4f83683815a32c3e66a')

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname}"

  install -m644 "${srcdir}/sqlops-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cp -r "${srcdir}/sqlops-linux-x64/"* "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/bin/sqlops "${pkgdir}/usr/bin/sqlops"
}
