# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=kokon-bin
pkgver=0.10.2
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
b2sums=('dd535a9f5afb9b834b4033f16ab06abae1a3e724b9271ef3f6df74a0ce6c58d72f434ae636ad59bf986e00f5bfd21c274febd4cc57a7774917ab7740e0d4162c')

package() {
  # Really nothing else to do here
  bsdtar -xOf "${noextract[0]}" 'data.tar.gz' | bsdtar -xf - -C "$pkgdir/"
}
