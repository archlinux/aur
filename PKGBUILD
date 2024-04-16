# Contributor: Alex <wowlinux at 126 dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=trdsql-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool that can execute SQL queries on CSV, LTSV, JSON and TBLN. Can output to various formats."
arch=('x86_64')
url="https://github.com/noborus/trdsql"
license=('MIT')
conflicts=('trdsql')
depends=('glibc')
source_x86_64=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/trdsql_v${pkgver}_linux_amd64.zip"
  "trdsql-completion.zsh"
)
b2sums_x86_64=('675a64cd1ad751ae241448cb5dec888d8a3825e9ceb48effa9f8551eba3e60b92a261c260b62831f53d33d4f84f5719dfe380e64c0add5e98b7e8048146f5b81'
               'fceaf4fa9dea5347e2dadf1360a53ad1a047467350cec6cccce066ece7a46d50aa867cefe58e89af9bec81471f9304999afbba26e730fb5bbb75cd1f2280beff')

package() {
  case $arch in
  x86_64) cd trdsql_v${pkgver}_linux_amd64  ;;
  i686)   cd trdsql_v${pkgver}_linux_386  ;;
  esac
  
  install -Dm 755 trdsql -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/trdsql"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/trdsql"
  install -Dm 644 config.json.sample -t "${pkgdir}/usr/share/doc/trdsql"
  install -Dm 644 "${srcdir}/trdsql-completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_trdsql"
}

# vim: ts=2 sw=2 et:
