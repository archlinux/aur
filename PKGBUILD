# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-qq-common
pkgver=2
pkgrel=1
pkgdesc='Common dependencies of Pantheon 3D and Pantheon Lite'
arch=('any')
url='https://github.com/quequotion/pantheon-qq'
license=('GPL3')
groups=('pantheon-qq')
depends=(pantheon-session)
optdepends=("elementary-blue-icon-theme-git: Restore blue folder icons to elementary theme"
            "file-roller-pantheon: Archive manipulator for GNOME (with elementary OS patches)"
            "lightdm-gtk-greeter: GTK+ Greeter for LightDM"
            "numlockx: Turn on the numlock key in X11"
            "pantheon-dock-instctl-git: Dock for Pantheon (with instance controls)"
            "xscreensaver-dbus-screenlock: xscreensaver locker for gnome-derivative desktops"
            "wingpanel-standalone-git: Stylish top panel (with autohide and without Gala dependencies)")
conflicts=('pantheon-workarounds')
source=('pantheon-session-qq'
        'numlockx-pantheon.desktop')
sha256sums=('f208ab4c523df5eb7716fa37d300f568ab84259ca82aefb06f7a064bcb190174'
            'd3c5deda2d6ef11451c2ea68043e4e424dd37858862a0c6251990243872f8311')

package() {
  #numlockx
  install -Dm644 {"${srcdir}","${pkgdir}"/etc/xdg/autostart}/numlockx-pantheon.desktop

  #Script to initiate Pantheon derivative gnome-sessions
  install -Dm755 {"${srcdir}","${pkgdir}"/usr/bin}/pantheon-session-qq

  echo "Get the latest dotfiles: https://gist.github.com/quequotion/a7c2e82451a87a05dbca50e5e8176615"
}
