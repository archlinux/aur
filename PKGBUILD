# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=inlyne-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='A GPU powered yet browserless tool to help you quickly view markdown files in the blink of an eye'
arch=(x86_64)
url="https://github.com/Inlyne-Project/inlyne"
license=(MIT)
source=("$url/releases/download/v$pkgver/inlyne-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
depends=(fontconfig gcc-libs freetype2 libxcursor libxi libxrandr openssl)
conflicts=('inlyne')
provides=('inlyne')
b2sums=('d1951ea2f1b11d10c8b96642f8a8806ca06380feeb51433d33e1aad5ae0f6cafd3b4fe6eb0d5878d39f121817bdfa56030685920643298a26245faf24da669a1')

package() {
  cd "$srcdir/inlyne-v$pkgver-x86_64-unknown-linux-gnu"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/inlyne/LICENSE"
  install -Dm755 inlyne "${pkgdir}/usr/bin/inlyne"

  install -Dm644 completions/inlyne.bash "${pkgdir}/usr/share/bash-completion/completions/inlyne.bash"
  install -Dm644 completions/inlyne.fish "${pkgdir}/usr/share/fish/vendor_completions.d/inlyne.fish"
  install -Dm644 completions/_inlyne "${pkgdir}/usr/share/zsh/site-functions/_inlyne"
}

# vi: filetype=sh shiftwidth=2 expandtab
