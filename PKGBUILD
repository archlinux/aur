# Maintainer: Utku Helvacı <utku.helvaci.tux@gmail.com>
# Contributor: Alexey Galakhov <agalakhov@gmail.com>
pkgname='rtpmidid-bin'
pkgver=24.12.2
pkgvermaj=$(echo "$pkgver" | cut -d. -f1,2)
pkgrel=1
pkgdesc="RTP MIDI User Space Driver Daemon"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/davidmoreno/rtpmidid'
license=('GPL3')
depends=('alsa-lib' 'fmt' 'avahi')
provides=('rtpmidid')
conflicts=('rtpmidid')
source_x86_64=('https://github.com/davidmoreno/rtpmidid/releases/download/v'"$pkgvermaj"'/rtpmidid_'"$pkgver"'_amd64.deb')
source_aarch64=('https://github.com/davidmoreno/rtpmidid/releases/download/v'"$pkgvermaj"'/rtpmidid_'"$pkgver"'_arm64.deb')
source_armv7h=('https://github.com/davidmoreno/rtpmidid/releases/download/v'"$pkgvermaj"'/rtpmidid_'"$pkgver"'_armhf.deb')

sha512sums_x86_64=('069d8729a00b1ead49d8df08c6fcd8f28d81250c3b0eaa0d3cc27dae404e7b86c7a4cbdbfa3b3f1c4bb000764879cc7c002b2720930764495e3de32acb5cf8ff')
sha512sums_aarch64=('4dbe749a27c03c51ea126497761d14f99423e3d8897c40e7cfc9948f2df94bccc7510db2981b117c94690aca31f127d03e0136db177e0dd507c729cdea5255bd')
sha512sums_armv7h=('545c4e2ace9a94c8a56afb207d421c3fa6d4627f28572f5870203c0f190f0901f15a7ec4301d58c10702e1af6a7db2c5fec14df509c8b74f4542d116c31f7e38')

install="post-install-remove.install"

package() {
  tar -I zstd -xf data.tar.zst ./etc ./usr
  cp -r etc usr "${pkgdir}"
}
