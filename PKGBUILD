# Maintainer: azunades <azunades at pm dot me>

pkgname=amazon-athena-odbc-bin
pkgver=2.0.6.0
pkgrel=1
pkgdesc="Amazon Athena ODBC Driver"
arch=('x86_64')
url="https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html"

depends=('unixodbc' 'glibc')

source=("https://downloads.athena.us-east-1.amazonaws.com/drivers/ODBC/v${pkgver}/Linux/AmazonAthenaODBC-${pkgver}.rpm")

sha256sums=('0317f5343328dc2e08f5ffeab93f53c95e824450ed1115c3ba0b3fd8680f8a21')

options=('!debug')

package() (
  depends=("${depends[@]}")
  mkdir -p "${pkgdir}/opt/athena/odbc"
  cp -r "${srcdir}/opt/athena/odbc/"* "${pkgdir}/opt/athena/odbc/"
)
