# Maintainer: Default User <default@user.com>
pkgname=vk-turn-proxy-server-bin
_pkgname=vk-turn-proxy-server
pkgver=1.2.2
pkgrel=1
pkgdesc="VK TURN Proxy - Server component (binary release)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/cacggghp/vk-turn-proxy"
license=('GPL3')
depends=('glibc')
provides=('vk-turn-proxy-server')
conflicts=('vk-turn-proxy-server-git' 'vk-turn-proxy-git')

source_x86_64=("${_pkgname}-x86_64::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/server-linux-amd64")
source_aarch64=("${_pkgname}-aarch64::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/server-linux-arm64")
source_armv7h=("${_pkgname}-armv7h::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/server-linux-arm")
source_i686=("${_pkgname}-i686::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/server-linux-386")

source=("vk-turn-proxy-server.service"
        "vk-turn-proxy-server.env")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_i686=('SKIP')
sha256sums=('67667fc990fde4084919ef3f94d98c2dc50505140291cd95cdf9659454b72d8d'
            'f6df4f1a25b8a250c60f0dc8e434e03803f3c26d459364f71621905af70b0d2b')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${CARCH}" "$pkgdir/usr/bin/vk-turn-proxy-server"
  install -Dm644 "$srcdir/vk-turn-proxy-server.service" "$pkgdir/usr/lib/systemd/system/vk-turn-proxy-server.service"
  install -Dm644 "$srcdir/vk-turn-proxy-server.env" "$pkgdir/etc/default/vk-turn-proxy-server"
}
