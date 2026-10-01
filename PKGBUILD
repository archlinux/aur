# Maintainer: Max <max@swk-web.com>
pkgname=devin-cli-bin
pkgver=3000.11.3
pkgrel=1
pkgdesc="Command-line interface for Devin, Cognition's AI software engineer"
arch=('x86_64' 'aarch64')
url="https://cli.devin.ai"
license=('custom')
provides=('devin-cli')
conflicts=('devin-cli')
options=('!strip' '!debug')

source_x86_64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-x86_64-unknown-linux.tar.gz")
sha256sums_x86_64=('83b3b113c01bf2a3e9e100db08d77e6b086806a7754f091e20831bdfe215157e')

source_aarch64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-aarch64-unknown-linux.tar.gz")
sha256sums_aarch64=('21a2d7a8dea67987067cde7eb3fe7193a48daa8f8c3d50d414c603c4a2b67f15')

package() {
  install -Dm755 "${srcdir}/bin/devin" "${pkgdir}/usr/bin/devin"

  if [ -d "${srcdir}/share/man/man1" ]; then
    install -d "${pkgdir}/usr/share/man/man1"
    install -m644 "${srcdir}"/share/man/man1/*.1 "${pkgdir}/usr/share/man/man1/"
  fi
}
