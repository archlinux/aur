# Maintainer: Raphael Quintao <raphaelquintao@gmail.com>
pkgname=qredshift
pkgver=1.0.1
pkgrel=1
pkgdesc="Stateless, modern multi-display screen color temperature CLI for X11 and Wayland"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'ppc64le' 'riscv64')
url="https://github.com/raphaelquintao/qredshift"
license=('Apache-2.0')

depends=('glibc' 'libx11' 'libxrandr' 'libxcb' 'xcb-util')
optdepends=('wayland: Wayland compositor support via wlr-gamma-control')
provides=("${pkgname}")
conflicts=("${pkgname}")

source_x86_64=("https://github.com/raphaelquintao/qredshift/releases/download/v$pkgver/${pkgname}_${pkgver}_x86_64.tar.gz")
source_i686=("https://github.com/raphaelquintao/qredshift/releases/download/v$pkgver/${pkgname}_${pkgver}_i686.tar.gz")
source_aarch64=("https://github.com/raphaelquintao/qredshift/releases/download/v$pkgver/${pkgname}_${pkgver}_aarch64.tar.gz")
source_armv7h=("https://github.com/raphaelquintao/qredshift/releases/download/v$pkgver/${pkgname}_${pkgver}_armv7l.tar.gz")
source_ppc64le=("https://github.com/raphaelquintao/qredshift/releases/download/v$pkgver/${pkgname}_${pkgver}_powerpc64le.tar.gz")
source_riscv64=("https://github.com/raphaelquintao/qredshift/releases/download/v$pkgver/${pkgname}_${pkgver}_riscv64.tar.gz")

package() {
  cd "$srcdir"

  install -Dm755 qredshift "$pkgdir/usr/bin/qredshift"
  install -Dm755 "libqredshift_wayland_$pkgver.so" "$pkgdir/usr/lib/qredshift/libqredshift_wayland_$pkgver.so"
  install -Dm644 bash_completion/qredshift "$pkgdir/usr/share/bash-completion/completions/qredshift"
  install -Dm644 man/qredshift.1 "$pkgdir/usr/share/man/man1/qredshift.1"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums_x86_64=('db0d640f92c28e220a887b5810bc0c66341240736c65ebc01a914b171bf8ce06')
sha256sums_i686=('77ea9f2d623945e76f3b18f1e86676bd0acb398a3dd2093aa33c44dba1532eb6')
sha256sums_aarch64=('34ee9e2367c96eaf4bc9275b73804f2208c9c2ff7727b8f6017d7006f99087f0')
sha256sums_armv7h=('696986d4375ce6ac059679a8e3945b0f19f8bf92aa359fa1e5f828d9d8f506cc')
sha256sums_ppc64le=('7288bdcb8aea9c16b38ef5e8fbb380f8aa302699602e90153e561f70f778f6af')
sha256sums_riscv64=('c18641237ba2b058da6ebac1a553ce9d5b0a4ce90c140988d99512678ff4d4a4')
