#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=float-app-bin
pkgver=20261109.0
pkgrel=1
pkgdesc="Persistently float selected Hyprland windows (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/float-app"
license=('Apache-2.0')
depends=('glibc' 'slurp')
provides=('float-app')
conflicts=('float-app' 'float-app-git')
options=('!strip')
source=('float-app.bash' 'float-app.fish' '_float-app' 'LICENSE')
source_x86_64=("float-app-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/float-app-${pkgver}-linux-${CARCH}.tar.gz")
source_aarch64=("float-app-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/float-app-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('e70795bdefa5526b790bb3cbbba61a814fcb9172333f309648f1aaf5074d89f3')
sha256sums_aarch64=('5a9ee33110b8afb81e6283e7fb876270e34263b22e5c2db2ae00db01550991d7')

package() {
  install -Dm755 float-app "$pkgdir/usr/bin/float-app"
  install -Dm644 "$srcdir/float-app.bash" "$pkgdir/usr/share/bash-completion/completions/float-app"
  install -Dm644 "$srcdir/float-app.fish" "$pkgdir/usr/share/fish/vendor_completions.d/float-app.fish"
  install -Dm644 "$srcdir/_float-app" "$pkgdir/usr/share/zsh/site-functions/_float-app"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
