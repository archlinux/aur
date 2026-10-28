# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=kokon-bin
pkgver=0.11.2
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
b2sums=('8691291274c8d149b8494bf3a6b3e36d09d2c3895911788613be7b4427604670d9b87e1da6acf9327b71c433acbda9ce98fb4f01f11f20e6663ad7ebf069815c')

package() {
  # Really nothing else to do here
  bsdtar -xOf "${noextract[0]}" 'data.tar.gz' | bsdtar -xf - -C "$pkgdir/"
}
