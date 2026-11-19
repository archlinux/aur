# Maintainer: Max <max@swk-web.com>
pkgname=devin-cli-bin
pkgver=3000.14.30821
pkgrel=1
pkgdesc="Command-line interface for Devin, Cognition's AI software engineer"
arch=('x86_64' 'aarch64')
url="https://cli.devin.ai"
license=('custom')
provides=('devin-cli')
conflicts=('devin-cli')
options=('!strip' '!debug')

source_x86_64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-x86_64-unknown-linux.tar.gz")
source_aarch64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-aarch64-unknown-linux.tar.gz")
sha256sums_x86_64=('4dc43e3e4388bace60fe2aa8010cbb399402e724892d7175845b1cdef00e7ddb')
sha256sums_aarch64=('3deb8af6b026060e975ed371936e139818020e5dc5abbcba07cde039f473a5a5')

package() {
  install -Dm755 "${srcdir}/bin/devin" "${pkgdir}/usr/bin/devin"

  if [ -d "${srcdir}/share/man/man1" ]; then
    install -d "${pkgdir}/usr/share/man/man1"
    install -m644 "${srcdir}"/share/man/man1/*.1 "${pkgdir}/usr/share/man/man1/"
  fi
}
