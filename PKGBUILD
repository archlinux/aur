# Maintainer: crux <c-rrux@outlook.com>

_exec_name=key-mcursor
pkgname=${_exec_name}-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Keyboard-driven mouse-cursor control (pre-built binary)"
arch=('x86_64')
url="https://github.com/rruxx/$_exec_name"
license=('AGPL-3.0-or-later')
provides=("$_exec_name=$pkgver")
conflicts=("$_exec_name")
install="$pkgname.install"
depends=('glibc')
source=("$url/releases/download/v$pkgver/$_exec_name-v$pkgver-$arch-unknown-linux-gnu.tar.zst")
sha256sums=('20cd179d99e209e2d549d2ee6e04ab5a1774e2c9a804eaa53a87cbc1ca569d6f')

# Binary tarball — no build step needed, makepkg auto-extracts.

package() {
    install -Dm755 "$srcdir/$_exec_name"  "$pkgdir/usr/bin/$_exec_name"
    install -Dm644 "$srcdir/${_exec_name}d.service" \
        "$pkgdir/usr/lib/systemd/system/${_exec_name}d.service"
}
