pkgname=discord-no-forced-update
pkgver=1.0.0
pkgrel=1
pkgdesc="Pacman hook that disables Discord's forced update prompt"
arch=('any')
url="https://aur.archlinux.org/packages/discord-no-forced-update"
license=('MIT')
depends=('discord' 'asar')
install=discord-no-forced-update.install
source=("discord-patch"
  "discord-noupdate.hook"
  "discord-no-forced-update.install")
sha256sums=('SKIP'
  'SKIP'
  'SKIP')

package() {
  install -Dm755 "$srcdir/discord-patch" "$pkgdir/usr/bin/discord-patch"
  install -Dm644 "$srcdir/discord-noupdate.hook" \
    "$pkgdir/etc/pacman.d/hooks/discord-noupdate.hook"
}
