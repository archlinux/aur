# Maintainer: Michał Minarowski <neoney@pm.me>
_pkgname="discord-canary-update-skip"
pkgname="$_pkgname"-git
_discordversion="ptb"
pkgver=r4.3cc6b1e
pkgrel=1
pkgdesc="A simple script to fix Discord Canary wanting to update while the update isn't in the repos."
arch=('any')
url="https://github.com/n3oney/discord-update-skip"
license=('MIT')
depends=('jq' 'discord-ptb' 'bash')
makedepends=('git')
install="$_pkgname".install
changelog=
source=('git+https://github.com/n3oney/discord-update-skip.git#branch='${_discordversion}
  )
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/discord-update-skip
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir"/discord-update-skip/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir"/discord-update-skip/set-config.sh "$pkgdir/usr/bin/$_pkgname"
}
