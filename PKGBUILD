# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aws-sso-creds-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Get temporary AWS SSO credentials from an SSO profile"
arch=('x86_64' 'aarch64')
url="https://github.com/jaxxstorm/aws-sso-creds"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/aws-sso-creds-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/aws-sso-creds-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('ac4198eb3e0af5c878949054e01de2ac51bd84cb13df1037f44398a66721995e')
sha256sums_aarch64=('beee60dd3573f361adf83fc119f8e2f85660b1551abfacca902070856dfe7143')

package() {
  install -Dm755 "aws-sso-creds" "${pkgdir}/usr/bin/aws-sso-creds"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
