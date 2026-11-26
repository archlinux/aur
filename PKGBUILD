# Maintainer: Myle <contact@myleapp.fr>
# Written by the release workflow of github.com/myleapp/api (packaging/aur/PKGBUILD.in): do not edit here.
pkgname=myle-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Command-line tool for the Myle API"
arch=('x86_64' 'aarch64')
url="https://developers.myleapp.fr/en/guides/cli"
license=('Apache-2.0')
provides=('myle')
conflicts=('myle')
options=('!strip' '!debug')
source_x86_64=("https://github.com/myleapp/api/releases/download/v${pkgver}/myle-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/myleapp/api/releases/download/v${pkgver}/myle-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('20532eed6f18a7584d34096856c763c5731418d37eec96e17770cccd6adae0bf')
sha256sums_aarch64=('e394d4a0c45e9413527851b114043a54d83ce2638f5e8eb747ef2aaffc105d75')

package() {
  install -Dm755 myle "${pkgdir}/usr/bin/myle"
  install -Dm644 completions/myle.bash "${pkgdir}/usr/share/bash-completion/completions/myle"
  install -Dm644 completions/_myle "${pkgdir}/usr/share/zsh/site-functions/_myle"
  install -Dm644 completions/myle.fish "${pkgdir}/usr/share/fish/vendor_completions.d/myle.fish"
  if [ -f man/myle.1 ]; then
    install -Dm644 man/myle.1 "${pkgdir}/usr/share/man/man1/myle.1"
  fi
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
