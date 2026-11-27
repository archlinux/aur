# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=kokon-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='Kokon creates and edits images from a sentence, privately on your own GPU, with Qwen-Image 2.1 via stable-diffusion.cpp. Everything runs on this PC.'
arch=('x86_64')
url="https://kokon.app"
license=('AGPL-3.0-only')
provides=('kokon')
conflicts=('kokon')
options=(!strip) # breaks kokon-mcp otherwise
depends=(openssl libgomp vulkan-icd-loader webkit2gtk-4.1 gtk3)
optdepends=('cuda: Runtime for NVIDIA GPUs')

noextract=("Kokon_${pkgver}_amd64.deb")
source=("https://github.com/GabrieleLozupone/kokon/releases/download/v${pkgver}/${noextract[0]}")
b2sums=('f145e736d97ec7a7497a544d31b67e3bf6a41fc956168d8375e9d7a72a88379e90d72c858f3bea6829fc29783f0e09c155d9607ceeb39531f85b617046468018')

package() {
  # Really nothing else to do here
  bsdtar -xOf "${noextract[0]}" 'data.tar.gz' | bsdtar -xf - -C "$pkgdir/"
}
