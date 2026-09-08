# Maintainer: local package
pkgname=wechat-xwayland
pkgver=1.0
pkgrel=1
pkgdesc='Launch wechat-bin through Qt XWayland with a KDE activation command'
arch=('any')
url='https://aur.archlinux.org/packages/wechat-bin'
license=('custom')
depends=('wechat-bin')
optdepends=('xorg-server-xwayland: run the Qt application through XWayland')
conflicts=('wechat-bin-xwayland')
source=('wechat-xwayland'
        'activate-wechat-xwayland::https://raw.githubusercontent.com/duanluan/shell-scripts/refs/heads/main/activate-wechat.sh'
        'wechat-xwayland.desktop')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/wechat-xwayland" \
    "$pkgdir/usr/bin/wechat-xwayland"
  install -Dm755 "$srcdir/activate-wechat-xwayland" \
    "$pkgdir/usr/bin/activate-wechat-xwayland"
  install -Dm644 "$srcdir/wechat-xwayland.desktop" \
    "$pkgdir/usr/share/applications/wechat-xwayland.desktop"
}
