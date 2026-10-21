# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=kokon-bin
pkgver=0.10.0
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
b2sums=('5bd6eede76ecbaa5f5d433b64ef5117c53e09253f98c185a17671cb8457b148faa39af9cc927aff19fd0698b1315b41079dcdf155fdfb67474163e30f9ea4219')

package() {
  # Really nothing else to do here
  bsdtar -xOf "${noextract[0]}" 'data.tar.gz' | bsdtar -xf - -C "$pkgdir/"
}
