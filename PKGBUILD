# Maintainer: pandada8 <pandada8@gmail.com>
pkgname=v2ray
pkgver=2.4.2
pkgrel=1
pkgdesc="A platform for building proxies to bypass network restrictions."
arch=('i686' 'x86_64')
url="https://github.com/v2ray/v2ray-core"
license=('MIT')
depends=('glibc')

source_i686=(v2ray-linux-32.zip::https://github.com/v2ray/v2ray-core/releases/download/v$pkgver/v2ray-linux-32.zip)
source_x86_64=(v2ray-linux-64.zip::https://github.com/v2ray/v2ray-core/releases/download/v$pkgver/v2ray-linux-64.zip)

md5sums_i686=('8b100a22341d2c3fd1224adea577a762')
md5sums_x86_64=('6e9f51a0f6af20efcc7b6e00938a364e')

arch_map=( ["i686"]="32"  ["x86_64"]="64")

package() {
  dir="$srcdir/v2ray-v$pkgver-linux-${arch_map[$CARCH]}"
  install -Dm644 $dir/systemd/v2ray.service ${pkgdir}/usr/lib/systemd/system/v2ray.service
  install -Dm755 $dir/v2ray ${pkgdir}/usr/bin/v2ray
  install -Dm644 $dir/vpoint_socks_vmess.json ${pkgdir}/etc/v2ray/vpoint_socks_vmess.json
  install -Dm644 $dir/vpoint_vmess_freedom.json ${pkgdir}/etc/v2ray/vpoint_vmess_freedom.json
}
