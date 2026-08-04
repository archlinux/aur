# Maintainer: azunades <azunades at pm dot me>

pkgname=amazon-athena-odbc-bin
pkgver=2.2.0.1
pkgrel=1
pkgdesc="Amazon Athena ODBC Driver"
arch=('x86_64')
url="https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html"

depends=('unixodbc' 'glibc')

source=("https://downloads.athena.us-east-1.amazonaws.com/drivers/ODBC/v${pkgver}/Linux/AmazonAthenaODBC-${pkgver}-${arch}.rpm")

sha256sums=('7fea7c551b1c4cdc770760937f3281d62fe0761d3d3066e6d3b2405b52f83a93')

options=('!debug')

package() (
  depends=("${depends[@]}")
  mkdir -p "${pkgdir}/opt/amazon/athena-odbc"
  cp -r "${srcdir}/opt/amazon/athena-odbc/"* "${pkgdir}/opt/amazon/athena-odbc/"
)
