# Maintainer: hup2c <hup@dr.com>
pkgname=onemessage-bin
pkgver=2.38.0
pkgrel=1
pkgdesc="OneMessage 中移集成"
arch=('x86_64')
url="https://www.cmccsi.cn/product/oneoffice"
license=('unknown')
depends=('gtk3')
# 上游服务器对 curl/wget 默认 UA 返回 404, 需使用浏览器 UA 下载
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla/5.0 -o %o %u')
source=("https://office.hecmcc.com:9003/cmict/file/resource/download/onemsgdownload/OneMessage2.0.deb")
sha256sums=('610ccb815a174bb58971f71574ab2cb708cebf743cc1292405b15714254ca47e')

prepare() {
    ar x "$srcdir/OneMessage2.0.deb"
    tar -xf data.tar.xz
}

package() {
    cp -r opt usr "$pkgdir/"
}
