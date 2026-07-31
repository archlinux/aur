# Maintainer: Raphael Quintao <raphaelquintao@gmail.com>
pkgname=qredshift
pkgver=1.0.0
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
sha256sums_x86_64=('92f0f40613c6702c5132e70dac972ae7608ea4695fd970c056424c05b72f8ec4')
sha256sums_i686=('559d31b8735ebc65017dae296f8027b3d391cb8899428f3314d8fc4db6e2c5e7')
sha256sums_aarch64=('14ce7531afd917dba6a6ef75c9ba53250b86886e8f26286a7a36e1cc139a79be')
sha256sums_armv7h=('32997999babd62b83227ef18a5dd10575f33c3a6a3770b70eb1d8ce17ff567de')
sha256sums_ppc64le=('ba16e970b0249d56a462ed622500724ade227c871ed2f0f08f260b55a81ef4fc')
sha256sums_riscv64=('28a4702284551df579b999c5cfc9b3b9c32998b1389300cc6b62cafe0d170d95')
