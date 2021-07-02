# Maintainer: Daniel Langbein <daniel@systemli.org>
pkgname="signal-desktop-minimized"
pkgver=0.0.1
pkgrel=1
pkgdesc="Signal Private Messenger for Linux (starts minimized in system-tray)"
arch=('any')
license=('MIT')
depends=('signal-desktop')
depends+=('holo' 'git' 'base')  # holo and its dependencies: git because of git-diff; without base "holo apply" may fail on initial system installation
install='.install'
source=('signal-desktop.desktop.holoscript' '.install')
sha256sums=('156c8db07afbcb84e95a4bc9bd0862abc955297c290b88536fdd95dc117119af'
            'df26ac8f56901970239fb165601eb61ec5444d710fbf2145092bab70758810fc')

package() {
  # Holo files script do change the "Exec=" line of the .desktop file
  install -Dm0544 signal-desktop.desktop.holoscript "$pkgdir"/usr/share/holo/files/"$pkgname"/usr/share/applications/signal-desktop.desktop.holoscript
}
