# Maintainer: Jay Tauron <jytrn@protonmail.com>

pkgname=s-bin
pkgver=0.5.15
pkgrel=1
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=()
options=('!strip' '!emptydirs')
provides=("s")
source=("${pkgname}.zip::https://github.com/zquestz/s/releases/download/v${pkgver}/s-linux_amd64.zip")
sha256sums=('38c29001936f1758159cc935b3ab97d1dee75c35ceacd8bd5ada3837b306192f')

package() {
  cd "${srcdir}/s-linux_amd64"

  install -Dm 775 "s" \
    "${pkgdir}/usr/bin/s"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/s/LICENSE"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/s/README.md"
  install -Dm 644 "autocomplete/s-completion.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/s"
  install -Dm644 "autocomplete/s.fish" \
    "${pkgdir}/usr/share/fish/vendor-completions.d/s.fish"
}
