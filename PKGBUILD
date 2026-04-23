pkgname=kernel-mitigations-off
pkgver=1.0.0
pkgrel=2
pkgdesc='Pacman hook to check and launch rebuild of AUR packages affected by updates'
arch=('x86_64')
url='https://github.com/Emiliopg91/kernel-mitigations-off'
license=('GPL-2')
depends=(
  'python'
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)

package() {
  cd "$srcdir/$pkgname"

  install -Dm644 "hooks/06-kernel-mitigations-off.hook" "$pkgdir/usr/share/libalpm/hooks/06-kernel-mitigations-off.hook"
  install -Dm644 "hooks/zy-kernel-mitigations-off.hook" "$pkgdir/usr/share/libalpm/hooks/zy-kernel-mitigations-off.hook"
  install -Dm755 "scripts/kernel-mitigations-off.py" "$pkgdir/usr/share/libalpm/scripts/kernel-mitigations-off"
}