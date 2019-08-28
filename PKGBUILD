# Maintainer: Gabriele Musco <emaildigabry@gmail.com>

pkgname=linux-firmware-agd5f-radeon-navi10
pkgver=2019.08.26.14.36
pkgrel=1
pkgdesc='Firmware for navi 10 GPUs from agd5f'
arch=('any')
url='https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/'
license=('GPL3')
depends=()
makedepends=()
provides=()
conflicts=()
source=(
  "$url/navi10_asd.bin"
  "$url/navi10_ce.bin"
  "$url/navi10_gpu_info.bin"
  "$url/navi10_me.bin"
  "$url/navi10_mec.bin"
  "$url/navi10_mec2.bin"
  "$url/navi10_pfp.bin"
  "$url/navi10_rlc.bin"
  "$url/navi10_sdma.bin"
  "$url/navi10_sdma1.bin"
  "$url/navi10_smc.bin"
  "$url/navi10_sos.bin"
  "$url/navi10_vcn.bin"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  date -d "$(curl -sI $url/navi10_asd.bin | fgrep -i 'last-modified' | cut -d' ' -f 3-7)" -u +%Y.%m.%d.%H.%M
}

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/lib/firmware/amdgpu/
  install -m 644 navi10_*.bin $pkgdir/usr/lib/firmware/amdgpu/
}
