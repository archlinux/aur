# Maintainer: linkman developers <zaidejjo@users.noreply.github.com>

pkgname=linkman-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A fast, beautiful TUI + CLI for creating and managing symlinks'
arch=('x86_64')
url='https://github.com/zaidejjo/linkman'
license=('MIT')
provides=('linkman')
conflicts=('linkman')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/linkman-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('33305cd2fc70bb7909d7c63c0971452ef3657314b6d453ead1c1b2c3cb0766be')

package() {
  cd "linkman-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 linkman "${pkgdir}/usr/bin/linkman"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 completions/linkman.bash "${pkgdir}/usr/share/bash-completion/completions/linkman"
  install -Dm644 completions/_linkman "${pkgdir}/usr/share/zsh/site-functions/_linkman"
  install -Dm644 completions/linkman.fish "${pkgdir}/usr/share/fish/vendor_completions.d/linkman.fish"
}
