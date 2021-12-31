pkgname=abnt2-ext
pkgver=3.0.0
pkgrel=1
pkgdesc="ABNT2 extended keyboard"
arch=(any)
url="https://github.com/kugland/abnt2-ext-arch"
license=('GPL')
depends=(
    'xkeyboard-config'
    'python-lxml'
)
source=(
    'abnt2_ext'
    'patch_evdev.py'
    'abnt2-patch-evdev.hook'
)
sha256sums=('c5f1cfe3cabb17c0912409fa9c283a360a7d1ae9407751b484b5c2b7f8f48c01'
            '74194d63c9bde72e8cd9a4c05d2711cda99a2208bc0ce43b0d6973aaae5edee3'
            'cc2b039de1cf0f6e179a3fdb9c6c9959626e9378343388aadf63e05a3f2fc93a')

package() {
  cd "$srcdir/"

  install -D -m 644 -o root -g root abnt2_ext "$pkgdir/usr/share/X11/xkb/symbols/abnt2_ext"
  install -D -m 644 -o root -g root patch_evdev.py "$pkgdir/usr/share/abnt2-ext/patch_evdev.py"
  install -D -m 644 -o root -g root abnt2-patch-evdev.hook "$pkgdir/usr/share/libalpm/hooks/abnt2-patch-evdev.hook"
}
