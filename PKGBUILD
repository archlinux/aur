# Maintainer: azunades <azunades at pm dot me>

pkgname=amazon-athena-odbc-bin
pkgver=2.1.0.0
pkgrel=1
pkgdesc="Amazon Athena ODBC Driver"
arch=('x86_64')
url="https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html"

depends=('unixodbc' 'glibc')

source=("https://downloads.athena.us-east-1.amazonaws.com/drivers/ODBC/v${pkgver}/Linux/AmazonAthenaODBC-${pkgver}.rpm")

sha256sums=('5571cd53e4c2183ae1c8056619a59557283178b6f7a389d47b462b0fd392956b')

options=('!debug')

package() (
  depends=("${depends[@]}")
  mkdir -p "${pkgdir}/opt/athena/odbc"
  cp -r "${srcdir}/opt/athena/odbc/"* "${pkgdir}/opt/athena/odbc/"
)
