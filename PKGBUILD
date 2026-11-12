# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=kokon-bin
pkgver=0.12.1
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
b2sums=('59263e3f69de0cafd472c6f57710b9e8684a56f61828fa68dd5f8a61cf993ef1179cee2e7f6b608291eb5ced201fc784c2a7631ab5dcf67420142f069e92e381')

package() {
  # Really nothing else to do here
  bsdtar -xOf "${noextract[0]}" 'data.tar.gz' | bsdtar -xf - -C "$pkgdir/"
}
