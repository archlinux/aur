# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Marcel Hoppe <hoppe.marcel@gmail.com>

pkgname=retroarch-session
pkgver=0.2
pkgrel=1
pkgdesc='Start retroarch via login manager as wayland or X11 session.'
arch=('any')
source=('retroarch.desktop'
        'retroarch-session.sh'
        'retroarch-xorg.desktop')
sha256sums=('5728b7bd4c113f995608912d91ce9a6fea271b7feea8542e617512a7d3718813'
            '3345b9a96121a767c835349218fd96220a973e370a2519f6a7035f3f1fceab5b'
            'f91f69f146fa216a9480eadf583748eb444a7d387dc5d4357bd7d2cd5030bdae')
license=('GPL')
depends=('xorg-xset' 'retroarch')

package() {
  install -d -m755 "$pkgdir/etc/retroarch-session"
  install -D -m644 retroarch.desktop       "$pkgdir"/usr/share/wayland-sessions/retroarch.desktop
  install -D -m644 retroarch.desktop       "$pkgdir"/usr/share/xsessions/retroarch.desktop
  install -D -m644 retroarch-xorg.desktop  "$pkgdir"/usr/share/xsessions/retroarch-xorg.desktop
  install -D -m755 retroarch-session.sh    "$pkgdir"/usr/bin/retroarch-session.sh
}
