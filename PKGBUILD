# Maintainer: Scott Coffman <scott at allthingslinux dot org>

pkgname=penguinguide-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Friendly Linux helper tool for new users"
arch=('x86_64' 'aarch64')
url="https://github.com/scottc943/penguinguide"
license=('MIT')
provides=('penguinguide')
conflicts=('penguinguide')
depends=('glibc')

_arch=
case "$CARCH" in
  x86_64) _arch=amd64 ;;
  aarch64) _arch=arm64 ;;
  *) _arch="$CARCH" ;;
esac

source=("https://github.com/scottc943/penguinguide/releases/download/v${pkgver}/penguinguide_${pkgver}_linux_${_arch}.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "penguinguide" "$pkgdir/usr/bin/penguinguide"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "man/penguinguide.1" "$pkgdir/usr/share/man/man1/penguinguide.1"
}
