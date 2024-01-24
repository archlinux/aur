pkgname=piper-tts-bin
pkgver=2023.11.14
_pkgver=2023.11.14-2
pkgrel=1
pkgdesc="A fast, local neural text to speech system"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/rhasspy/piper"
license=('MIT')
provides=('piper-tts')
depends=(gcc-libs glibc)
source_x86_64=("$url/releases/download/${_pkgver}/piper_linux_x86_64.tar.gz")
source_aarch64=("$url/releases/download/${_pkgver}/piper_linux_aarch64.tar.gz")
source_armv7h=("$url/releases/download/${_pkgver}/piper_linux_armv7l.tar.gz")
sha256sums_x86_64=('a50cb45f355b7af1f6d758c1b360717877ba0a398cc8cbe6d2a7a3a26e225992')
sha256sums_aarch64=('fea0fd2d87c54dbc7078d0f878289f404bd4d6eea6e7444a77835d1537ab88eb')
sha256sums_armv7h=('c6946fcd57c705ed1d4666ea880f80ba0bbbd14de62ecbdd13460baf3bac8e37')

package() {
  install -d -m755 "$pkgdir"/opt "$pkgdir"/usr/bin
  mv "$srcdir"/piper "$pkgdir"/opt/piper-tts
  ln -s /opt/piper-tts/piper "$pkgdir"/usr/bin/piper-tts
}

