# Maintainer: Rufus Deponian <rufus at deponian dot com>
pkgname=logalize-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Fast and extensible log colorizer. Alternative to ccze. Pre-compiled."
arch=('x86_64')
url="https://github.com/deponian/logalize"
license=('MIT')
conflicts=('logalize')
backup=('etc/logalize/logalize.yaml')
source=("${pkgname}-${pkgver}.tar.zst::https://github.com/deponian/logalize/releases/download/v${pkgver}/logalize_${pkgver}_linux_amd64.pkg.tar.zst")
sha256sums=('c9400e6fb7748d79189d036aa2de2ee058072c8c7d3fac1ed3b21978855603d3')

package() {
  # bin
  install -Dm755 "${srcdir}/usr/bin/logalize" "${pkgdir}/usr/bin/logalize"
  
  # man
  install -Dm644 "${srcdir}/usr/share/man/man1/logalize.1.gz" "${pkgdir}/usr/share/man/man1/logalize.1.gz"

  # completions
  install -Dm644 "${srcdir}/usr/share/bash-completion/completions/logalize" "${pkgdir}/usr/share/bash-completion/completions/logalize"
  install -Dm644 "${srcdir}/usr/share/fish/vendor_completions.d/logalize.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/logalize.fish"
  install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_logalize" "${pkgdir}/usr/share/zsh/site-functions/_logalize"

  # configuration file
  install -Dm644 "${srcdir}/etc/logalize/logalize.yaml" "${pkgdir}/etc/logalize/logalize.yaml"

  # license
  install -Dm644 "${srcdir}/usr/share/licenses/logalize/LICENSE" "${pkgdir}/usr/share/licenses/logalize-bin/LICENSE"

  # docs
  install -Dm644 "${srcdir}/usr/share/doc/logalize/README" "${pkgdir}/usr/share/doc/logalize/README.md"
  install -Dm644 "${srcdir}/usr/share/doc/logalize/CHANGELOG" "${pkgdir}/usr/share/doc/logalize/CHANGELOG.md"
}
