#!/bin/bash
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=float-app-bin
pkgver=20260922.0
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
source_x86_64=("float-app-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/${pkgver}/float-app-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("float-app-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/${pkgver}/float-app-${pkgver}-linux-aarch64.tar.gz")
sha256sums=(
  'e9e1826edc8e44abe37b75e4b911d566ce29514b4038acc848aeaccecaf411f1'
  'bae17d6973705e9eeb84ee9a6414d9fef3e1ab12d6557ba76e3c33e6651ee62b'
  '07b920b85fba70ff4af6ace8b059e605d96775a22eb93c5a93bf330bab616fdf'
  'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
)
sha256sums_x86_64=('6f487267a375b1cb3c8a9e8fcf40f750babe24d8fc7b8dfa3fa726636f9461bc')
sha256sums_aarch64=('688f2256a19fdc7a007920f3e1d69f2403f6efcd1560dd12ea6916011d127956')

package() {
  install -Dm755 float-app "$pkgdir/usr/bin/float-app"
  install -Dm644 "$srcdir/float-app.bash" "$pkgdir/usr/share/bash-completion/completions/float-app"
  install -Dm644 "$srcdir/float-app.fish" "$pkgdir/usr/share/fish/vendor_completions.d/float-app.fish"
  install -Dm644 "$srcdir/_float-app" "$pkgdir/usr/share/zsh/site-functions/_float-app"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
