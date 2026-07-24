# Maintainer: Raphael Quintao <raphaelquintao@gmail.com>
pkgname=qredshift
_pkgver=1.0.0
pkgver=1.0.0
pkgrel=1
pkgdesc="Stateless, modern multi-display screen color temperature CLI for X11 and Wayland"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'ppc64le')
url="https://github.com/raphaelquintao/QRedshift"
license=('Apache-2.0')

depends=('glibc' 'libx11' 'libxrandr' 'libxcb' 'xcb-util')
optdepends=('libwayland-client: Required for Wayland backend support')

source_x86_64=("https://github.com/raphaelquintao/QRedshift/releases/download/v$pkgver/${pkgname}_${pkgver}_x86_64.tar.gz")
sha256sums_x86_64=('SKIP')

source_i686=("https://github.com/raphaelquintao/QRedshift/releases/download/v$pkgver/${pkgname}_${pkgver}_i686.tar.gz")
sha256sums_i686=('SKIP')

source_aarch64=("https://github.com/raphaelquintao/QRedshift/releases/download/v$pkgver/${pkgname}_${pkgver}_aarch64.tar.gz")
sha256sums_aarch64=('SKIP')

source_armv7h=("https://github.com/raphaelquintao/QRedshift/releases/download/v$pkgver/${pkgname}_${pkgver}_armv7l.tar.gz")
sha256sums_armv7h=('SKIP')

source_ppc64le=("https://github.com/raphaelquintao/QRedshift/releases/download/v$pkgver/${pkgname}_${pkgver}_powerpc64le.tar.gz")
sha256sums_ppc64le=('SKIP')

package() {
  cd "$srcdir"

  install -Dm755 qredshift "$pkgdir/usr/bin/qredshift"

  install -Dm755 "libqredshift_wayland_$pkgver.so" "$pkgdir/usr/lib/qredshift/libqredshift_wayland_$pkgver.so"

  install -Dm644 bash_completion/qredshift "$pkgdir/usr/share/bash-completion/completions/qredshift"
  install -Dm644 man/qredshift.1 "$pkgdir/usr/share/man/man1/qredshift.1"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
