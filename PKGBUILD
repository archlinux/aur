# Maintainer: Carlos Prieto Ortiz <prietus@live.com>

pkgname=locklet
pkgver=0.2.0
pkgrel=1
pkgdesc='Lock screen for river and rivermonad (ext-session-lock-v1), with the blurred wallpaper of bgmonad'
url='https://github.com/prietus/locklet'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-gobject' 'gtk4' 'gtk4-layer-shell' 'pam')
optdepends=('python-pillow: blurred background that flows slowly (else GTK blurs it, still)'
            'grim: start from the screen as it was and crossfade'
            'bgmonad: the same wallpaper as the desktop on every output')
backup=('etc/pam.d/locklet')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6eafdfad2e1b59d422efcb2597e1a842197ca7c8cc968e83d5cad8d53c23419e')

package() {
  cd $pkgname-$pkgver
  install -Dm755 locklet -t "$pkgdir/usr/bin"
  install -Dm644 pam/locklet "$pkgdir/etc/pam.d/locklet"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
