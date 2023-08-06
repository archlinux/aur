pkgname=piper-tts-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast, local neural text to speech system"
arch=('x86_64' 'aarch64')
url="https://github.com/rhasspy/piper"
license=('MIT')
provides=('piper-tts')
depends=(gcc-libs glibc)
source_x86_64=("https://github.com/rhasspy/piper/releases/download/v${pkgver}/piper_amd64.tar.gz")
source_aarch64=("https://github.com/rhasspy/piper/releases/download/v${pkgver}/piper_arm64.tar.gz")
sha256sums_x86_64=('467c17935d2a22dcce9dc9e08ba07485e29be813097e7cf08c5627aa09d32e42')
sha256sums_aarch64=('34b298f6b3e55b55e81f05c6157310f9ec4df3fdd3d73e4c85eb80e218c54d2c')

package() {
  install -d -m755 "$pkgdir"/opt "$pkgdir"/usr/bin
  mv "$srcdir"/piper "$pkgdir"/opt/piper-tts
  ln -s /opt/piper-tts/piper "$pkgdir"/usr/bin/piper-tts
}

