# Maintainer: bilabila <bilabila@qq.com>
_pkgname=BaiduExporter
pkgname=baiduexporter
pkgver=r436.7723f32
pkgrel=1
pkgdesc='Assistant for Baidu to export download links to aria2/aria2-rpc'
arch=('x86_64')
url='https://github.com/acgotaku/BaiduExporter'
provides=('baiduexporter')
conflicts=('baiduexporter')
license=('GPL3')
source=('git+https://github.com/acgotaku/BaiduExporter')
sha512sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    d="$pkgdir"/usr/share
    install -Dm644 $_pkgname/LICENSE $d/licenses/$pkgname/LICENSE
    d="$d"/$pkgname
    cp -rT $_pkgname/chrome/release "$d"
    find "$d" -type d -exec chmod 755 {} +
    find "$d" -type f -exec chmod 644 {} +
    echo -e "\nload unpacked /usr/share/$pkgname\n"
}
