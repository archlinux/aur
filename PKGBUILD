# Maintainer: Sebastian Arrieta <sarrietav.dev@gmail.com>
pkgname=omaread-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="A fast, keyboard-first EPUB reader for Omarchy (prebuilt)"
arch=('x86_64')
url="https://github.com/sarrietav-dev/omaread"
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'glibc' 'gcc-libs' 'alsa-lib')
optdepends=('speech-dispatcher: read aloud with Piper'
            'hyphen-en: English hyphenation'
            'hyphen-es: Spanish hyphenation')
provides=('omaread')
conflicts=('omaread')
options=('!debug')
source=("$url/releases/download/v$pkgver/omaread-$pkgver-x86_64.tar.gz")
sha256sums=('3ce14a936bb2217fa8e692ec46c2650e3fb6a5e05b92f24f64ebb7a7e581d9e8')

package() {
  cd "omaread-$pkgver-x86_64"
  install -Dm755 omaread "$pkgdir/usr/bin/omaread"
  install -Dm644 io.github.sarrietav_dev.Omaread.desktop \
    "$pkgdir/usr/share/applications/io.github.sarrietav_dev.Omaread.desktop"
  install -Dm644 io.github.sarrietav_dev.Omaread.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.sarrietav_dev.Omaread.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
