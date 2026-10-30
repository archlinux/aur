# Maintainer: Max <max@swk-web.com>
pkgname=devin-cli-bin
pkgver=3000.11.234
pkgrel=1
pkgdesc="Command-line interface for Devin, Cognition's AI software engineer"
arch=('x86_64' 'aarch64')
url="https://cli.devin.ai"
license=('custom')
provides=('devin-cli')
conflicts=('devin-cli')
options=('!strip' '!debug')

source_x86_64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-x86_64-unknown-linux.tar.gz")
sha256sums_x86_64=('201370cddd2924294e3ca6b46fd8ece49b5763953b644a1dd823fce5490cb41a')

source_aarch64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-aarch64-unknown-linux.tar.gz")
sha256sums_aarch64=('438ca7f8280b3ef0747afc406e827d9e182156000277a1660358ac4fbd04156e')

package() {
  install -Dm755 "${srcdir}/bin/devin" "${pkgdir}/usr/bin/devin"

  if [ -d "${srcdir}/share/man/man1" ]; then
    install -d "${pkgdir}/usr/share/man/man1"
    install -m644 "${srcdir}"/share/man/man1/*.1 "${pkgdir}/usr/share/man/man1/"
  fi
}
