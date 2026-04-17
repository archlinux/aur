pkgname=aur-check-rebuild
pkgver=1.2.0
pkgrel=1
pkgdesc='Pacman hook to check and launch rebuild of AUR packages affected by updates'
arch=('x86_64')
url='https://github.com/Emiliopg91/aur-check-rebuild'
license=('GPL-2')
depends=(
  'alacritty'
  'pacman'
  'python'
  'python-dataclasses-json'
  'python-psutil'
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)
install=${pkgname}.install

package() {
  cd "$srcdir/aur-check-rebuild"

  touch "aur-check-rebuild.log" 

  install -Dm644 "hooks/zz-aur-check-rebuild.hook" "$pkgdir/usr/share/libalpm/hooks/zz-aur-check-rebuild.hook"
  install -Dm755 "scripts/aur-check-rebuild.py" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild"
  install -Dm644 "settings.json" "$pkgdir/usr/share/aur-check-rebuild/settings.json"
  install -Dm644 "aur-check-rebuild.log" "$pkgdir/var/log/aur-check-rebuild.log"
}