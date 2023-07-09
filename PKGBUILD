pkgname=piper-tts-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A fast, local neural text to speech system"
arch=('x86_64' 'aarch64')
url="https://github.com/rhasspy/piper"
license=('MIT')
provides=('piper-tts')
depends=(gcc-libs glibc)
source_x86_64=("https://github.com/rhasspy/piper/releases/download/v${pkgver}/piper_amd64.tar.gz")
source_aarch64=("https://github.com/rhasspy/piper/releases/download/v${pkgver}/piper_arm64.tar.gz")
sha256sums_x86_64=('6309a3660c28e6b05977831422c1e8c14f63f18175e1bb4e6d802f1dfd096776')
sha256sums_aarch64=('7ad77c0f5f1917f49401bf335b87ccbab803972c055c8abe6967b2e71d1e4c55')

package() {
  install -d -m755 "$pkgdir"/opt "$pkgdir"/usr/bin
  mv "$srcdir"/piper "$pkgdir"/opt/piper-tts
  ln -s /opt/piper-tts/piper "$pkgdir"/usr/bin/piper-tts
}

