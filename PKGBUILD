# Maintainer: LS-Shandong < ls-shandong at outlook dot com >
pkgname=bookget-bin
pkgver=25.0116
pkgrel=2
pkgdesc="一款数字古籍图书下载工具，已支持约 50+ 个数字图书馆。"
arch=('x86_64')
url="https://github.com/deweizhu/bookget"
license=('GPL-3.0-only')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin}-git)
depends=(glibc)
optdepends=('dezoomify-rs: 适用于 Google Arts & Culture、Zoomify、IIIF 等的可缩放图片下载器')
options=('!strip' '!debug')
source=("${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.linux-amd64.tar.bz2")
sha256sums=('3DD28E600FE542E73F199636DF415D62254EFB906D7D75922095B7CD60B9D56C')

package () {
  tar -xvf ${pkgname%-bin}-${pkgver}.linux-amd64.tar.bz2
  install -Dm755 "$srcdir"/${pkgname%-bin}-${pkgver}.linux-amd64/${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm0644 "$srcdir"/${pkgname%-bin}-${pkgver}.linux-amd64/config.ini -t "${pkgdir}/etc/${pkgname%-bin}/"
}
