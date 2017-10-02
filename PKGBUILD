# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>

pkgname=retroarch-session
pkgbase=${pkgname}
pkgver=0.1
pkgrel=3
pkgdesc='Start retroarch via login manager as wayland or X11 session and shutdown the system when retroarch is closed.'
arch=('any')
source=('retroarch.desktop'
        'retroarch-session.sh'
        'retroarch-xorg.desktop')
sha256sums=('5728b7bd4c113f995608912d91ce9a6fea271b7feea8542e617512a7d3718813'
            '480e4ceeadee3defdbb7f723a29efb9df858fb98541bf7db0d26b35c76cf2788'
            'f91f69f146fa216a9480eadf583748eb444a7d387dc5d4357bd7d2cd5030bdae')
license=('GPL')
depends=('xorg-xset' 'retroarch')

package() {
  install -D -m644 "$srcdir"/../retroarch.desktop       "$pkgdir"/usr/share/wayland-sessions/retroarch.desktop
  install -D -m644 "$srcdir"/../retroarch.desktop       "$pkgdir"/usr/share/xsessions/retroarch.desktop
  install -D -m644 "$srcdir"/../retroarch-xorg.desktop  "$pkgdir"/usr/share/xsessions/retroarch-xorg.desktop
  install -D -m755 "$srcdir"/../retroarch-session.sh    "$pkgdir"/usr/bin/retroarch-session.sh
}
