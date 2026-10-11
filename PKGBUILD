# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=vok_sk
pkgver=1.0
pkgrel=14
pkgdesc="Vogo's Keyboard layout (Slovak) for X11 and Wayland"
arch=(any)
url="http://www.abclinuxu.cz/blog/origami/2006/12/21/162644"
license=("custom")
depends=('xkeyboard-config' 'xmlstarlet' 'sed')
install=vok_sk.install
source=(https://gitlab.com/vojta_vogo/vok/raw/master/xorg/${pkgname}
        vok_sk-register
        vok_sk.hook)
md5sums=('2a99ad4873dda74f1a44e16e5d603df1'
         'a204adf5eb5e4b798c0e2eb673ff459f'
         'cdf8be15cbdfa3987178b31c3d30ca38')

package() {
  install -Dm644 "$srcdir/vok_sk" "$pkgdir/usr/share/xkeyboard-config-2/symbols/vok_sk"
  install -Dm755 "$srcdir/vok_sk-register" "$pkgdir/usr/lib/vok_sk/vok_sk-register"
  install -Dm644 "$srcdir/vok_sk.hook" "$pkgdir/usr/share/libalpm/hooks/vok_sk.hook"
}
