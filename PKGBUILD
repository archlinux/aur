# Maintainer: Utku Helvacı <utku.helvaci.tux@gmail.com>
# Contributor: Alexey Galakhov <agalakhov@gmail.com>
pkgname='rtpmidid-bin'
pkgver=24.12.2
pkgvermaj=$(echo "$pkgver" | cut -d. -f1,2)
pkgrel=1
pkgdesc="RTP MIDI User Space Driver Daemon"
arch=('x86_64')
url='https://github.com/davidmoreno/rtpmidid'
license=('GPL3')
depends=('alsa-lib' 'fmt' 'avahi')
provides=('rtpmidid')
conflicts=('rtpmidid')
source=('https://github.com/davidmoreno/rtpmidid/releases/download/v'"$pkgvermaj"'/rtpmidid_'"$pkgver"'_amd64.deb')

sha512sums=('069d8729a00b1ead49d8df08c6fcd8f28d81250c3b0eaa0d3cc27dae404e7b86c7a4cbdbfa3b3f1c4bb000764879cc7c002b2720930764495e3de32acb5cf8ff')

package() {
  tar -I zstd -xf data.tar.zst ./etc ./usr
  cp -r etc usr "${pkgdir}"
}
