# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=markdown-blog-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Fast Markdown blog server"
arch=('x86_64' 'aarch64')
url="https://github.com/gaowei-space/markdown-blog"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gaowei-space/markdown-blog/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/markdown-blog-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/markdown-blog-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('2a267a87f93d670eebada88d4fef1ee88437329c89856357558c99eab6e990fd')
sha256sums_x86_64=('c6c7d3143d4c594f26a1cb75a4972ae5f019dd430aaa882a19f95d072db459d3')
sha256sums_aarch64=('0fd84286e03ed4058daf4fae9d08907a04adf824f6e0a9bdca3b43ff61c42aeb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="markdown-blog-linux-amd64" ;;
    aarch64) _dir="markdown-blog-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/markdown-blog" "${pkgdir}/usr/bin/markdown-blog"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
