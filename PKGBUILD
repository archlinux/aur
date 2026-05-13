# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/Inlyne-Project/inlyne"
license=(MIT)
source=("$url/releases/download/v$pkgver/inlyne-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr openssl)
conflicts=('inlyne')
provides=('inlyne')
b2sums=('ad305c6eb0cd63f1f9e3a6abf6652903a6fd4bea6a94ec538fadb54624846be46b4f57283f40988451a1591966f990dd5ccac5f7e16cfa14c0738ebce075c76e')

package() {
  cd "$srcdir/inlyne-v$pkgver-x86_64-unknown-linux-gnu"

  install -Dm644 inlyne.desktop "${pkgdir}/usr/share/applications/inlyne.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/inlyne/LICENSE"
  install -Dm755 inlyne "${pkgdir}/usr/bin/inlyne"

  install -Dm644 completions/inlyne.bash "${pkgdir}/usr/share/bash-completion/completions/inlyne.bash"
  install -Dm644 completions/inlyne.fish "${pkgdir}/usr/share/fish/vendor_completions.d/inlyne.fish"
  install -Dm644 completions/_inlyne "${pkgdir}/usr/share/zsh/site-functions/_inlyne"
}

# vi: filetype=sh shiftwidth=2 expandtab
