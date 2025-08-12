# Maintainer: azunades <azunades at pm dot me>

pkgname=amazon-athena-odbc-bin
pkgver=2.0.4.0
pkgrel=1
pkgdesc="Amazon Athena ODBC Driver"
arch=('x86_64')
url="https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html"

depends=('unixodbc' 'glibc')

source=("https://downloads.athena.us-east-1.amazonaws.com/drivers/ODBC/v${pkgver}/Linux/AmazonAthenaODBC-${pkgver}.rpm")

sha256sums=('c2e795ea4afe1bd75d6e03f23dc1ccbc2b50a6311c29aa2c733dae41693f77be')

options=('!debug')

package() (
  depends=("${depends[@]}")
  mkdir -p "${pkgdir}/opt/athena/odbc"
  cp -r "${srcdir}/opt/athena/odbc/"* "${pkgdir}/opt/athena/odbc/"
)
