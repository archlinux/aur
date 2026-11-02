# Maintainer: planktonzp <ruizhipeng001@gmail.com>

pkgname=rose-pine-swaync-git
_pkgname=swaync
pkgver=r9.d506efe
pkgrel=1
pkgdesc='Soho vibes for SwayNotificationCenter'
arch=('any')
url='https://github.com/rose-pine/swaync'
license=('MIT')
depends=('swaync')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+https://github.com/rose-pine/swaync.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 theme/rose-pine.css \
    "$pkgdir/usr/share/swaync/themes/rose-pine.css"
  install -Dm644 theme/rose-pine-dawn.css \
    "$pkgdir/usr/share/swaync/themes/rose-pine-dawn.css"
  install -Dm644 theme/rose-pine-moon.css \
    "$pkgdir/usr/share/swaync/themes/rose-pine-moon.css"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
