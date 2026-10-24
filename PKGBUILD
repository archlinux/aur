# Maintainer: jnmbk <ugur.jnmbk@gmail.com>
pkgname=rnazar-bin
_pkgname=rnazar
pkgver=0.8.3
pkgrel=1
pkgdesc="System tray evil eye ward and crash notifier"
arch=('x86_64')
url="https://github.com/jnmbk/rnazar"
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-1-$arch.pkg.tar.zst")
sha256sums_x86_64=('3baa4a1f32465c73583768c785e66dd80c9d326491d1899b3ac520fbe3db1d68')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
    if [ -f "$srcdir/usr/share/licenses/$_pkgname/LICENSE" ] && [ ! -d "$pkgdir/usr/share/licenses/$pkgname" ]; then
      install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
      ln -s "/usr/share/licenses/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

