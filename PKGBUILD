# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=1.0.60
pkgrel=1
pkgdesc="Grok CLI - command line interface for xAI's Grok"
arch=('x86_64' 'aarch64')
url="https://x.ai/cli"
license=('LicenseRef-xAI-Grok-CLI')
provides=('grok')
conflicts=('grok')
options=('!strip')
source_x86_64=("grok-$pkgver-x86_64::https://x.ai/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok-$pkgver-aarch64::https://x.ai/cli/grok-${pkgver}-linux-aarch64")
sha512sums_x86_64=('fd34403d39ad5cfa52a9b5c1d082184ebcf5db366fa1f9519bbcf6d57e6d5bd1942f197c4cd64be54b22529d9d9b3ff57e7a381c1225db27e33bf16f3718a6e6')
sha512sums_aarch64=('bc3dbbf82922bf0ea126d41cfa554da959b61254508f9aa3e561149d9dba5d09c340511218f02c4cf025e256a2223991995399762a1482ac8e1dc0f220cec190')

package() {
  local _bin
  case "$CARCH" in
    aarch64) _bin="grok-$pkgver-aarch64" ;;
    *)       _bin="grok-$pkgver-x86_64" ;;
  esac
  install -Dm755 "$_bin" "${pkgdir}/usr/bin/grok"
}
