# Maintainer: azunades <azunades at pm dot me>

pkgname=amazon-athena-odbc-bin
pkgver=2.0.5.1
pkgrel=1
pkgdesc="Amazon Athena ODBC Driver"
arch=('x86_64')
url="https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html"

depends=('unixodbc' 'glibc')

source=("https://downloads.athena.us-east-1.amazonaws.com/drivers/ODBC/v${pkgver}/Linux/AmazonAthenaODBC-${pkgver}.rpm")

sha256sums=('b274cb6860657341ef69ad261e85d66f050c38ed136e2e8c67ac05a13a1be9b0')

options=('!debug')

package() (
  depends=("${depends[@]}")
  mkdir -p "${pkgdir}/opt/athena/odbc"
  cp -r "${srcdir}/opt/athena/odbc/"* "${pkgdir}/opt/athena/odbc/"
)
