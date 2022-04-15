# Maintainer: Michał Minarowski <neoney@pm.me>
_pkgname="discord-update-skip"
pkgname="$_pkgname"-git
_discordversion="stable"
pkgver=r2.b860122
pkgrel=1
pkgdesc="A simple script to fix Discord wanting to update while the update isn't in the repos."
arch=('any')
url="https://github.com/n3oney/discord-update-skip"
license=('MIT')
depends=('jq' 'discord' 'bash')
makedepends=('git')
install="$_pkgname".install
changelog=
source=('git+https://github.com/n3oney/discord-update-skip.git#branch='${_discordversion}
  )
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir"/"$_pkgname"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir"/"$_pkgname"/set-config.sh "$pkgdir/usr/bin/$_pkgname"
}
