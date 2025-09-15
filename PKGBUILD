# Maintainer: azunades <azunades at pm dot me>

pkgname=amazon-athena-odbc-bin
pkgver=2.0.5.0
pkgrel=1
pkgdesc="Amazon Athena ODBC Driver"
arch=('x86_64')
url="https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html"

depends=('unixodbc' 'glibc')

source=("https://downloads.athena.us-east-1.amazonaws.com/drivers/ODBC/v${pkgver}/Linux/AmazonAthenaODBC-${pkgver}.rpm")

sha256sums=('8d5bf459ffcfa047414846f9cc666af3c0871340f4111b0447b22cdc2d472663')

options=('!debug')

package() (
  depends=("${depends[@]}")
  mkdir -p "${pkgdir}/opt/athena/odbc"
  cp -r "${srcdir}/opt/athena/odbc/"* "${pkgdir}/opt/athena/odbc/"
)
