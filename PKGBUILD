# Maintainer: Alex <wowlinux at 126 dot com>

pkgname=trdsql-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="CLI tool that can execute SQL queries on CSV, LTSV, JSON and TBLN. Can output to various formats."
arch=('x86_64' 'i686')
url="https://github.com/noborus/trdsql"
license=('MIT')
conflicts=('trdsql')
depends=('glibc')
source_x86_64=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/trdsql_v${pkgver}_linux_amd64.zip"
  "trdsql-completion.zsh"
)
source_i686=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/trdsql_v${pkgver}_linux_386.zip"
  "trdsql-completion.zsh"
)
md5sums_x86_64=('2397870d7840d9c7b3e21aaa5e82ee92'
                '9c1a02ea5fce190b3e829f1ee430dac4')
md5sums_i686=('2397870d7840d9c7b3e21aaa5e82ee92'
              '9c1a02ea5fce190b3e829f1ee430dac4')

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
