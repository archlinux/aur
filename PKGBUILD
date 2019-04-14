# Maintainer: bilabila <bilabila@qq.com>
_srcname=BaiduExporter
_pkgname=baiduexporter
pkgname=$_pkgname-git
pkgver=r436.7723f32
pkgrel=3
pkgdesc='Assistant for Baidu to export download links to aria2/aria2-rpc'
arch=('x86_64')
url='https://github.com/acgotaku/BaiduExporter'
provides=($_srcname $_pkgname)
conflicts=($_srcname $_pkgname)
license=('GPL3')
source=('git+https://github.com/acgotaku/BaiduExporter')
sha512sums=('SKIP')
install=$pkgname.install
package() {
    d="$pkgdir"/usr/share
    install -Dm644 $_srcname/LICENSE "$d"/licenses/$_pkgname/LICENSE
    d="$d"/$_pkgname
    cp -rT $_srcname/chrome/release "$d"
    find "$d" -type d -exec chmod 755 {} +
    find "$d" -type f -exec chmod 644 {} +
}
