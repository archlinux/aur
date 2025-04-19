# Maintainer: baboon

pkgname="xenia-canary-bin"
pkgver=$( echo $(curl -s "https://api.github.com/repos/xenia-canary/xenia-canary-releases/releases/latest" | grep tag_name) | cut -b 14-20 )
pkgrel=1
pkgdesc="Xenia Canary is an experimental fork of the Xenia emulator. "
arch=('x86_64')
url="https://github.com/xenia-canary"
license=('BSD-3-Clause')
depends=(
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libx11'
  'libxcb'
  'sdl2'
  'zlib')
  makedepends=()
_target="xenia_canary_linux.tar.gz"
conflicts=()
provides=('xenia-canary')
source=("https://github.com/xenia-canary/xenia-canary-releases/releases/download/${pkgver}/${_target}"
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/1024.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/512.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/256.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/128.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/64.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/48.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/32.png'
        'https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/16.png'
        'xenia-canary-bin'
        'xenia-canary-bin.desktop')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
options=('!strip')

prepare() {
    tar xvf "${_target}"
}

package() {
  install -Dm755 xenia_canary "${pkgdir}/usr/bin/xenia_canary"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/xenia-canary.png"
  install -Dm644 32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/xenia-canary.png"
  install -Dm644 48.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/xenia-canary.png"
  install -Dm644 64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/xenia-canary.png"
  install -Dm644 128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/xenia-canary.png"
  install -Dm644 256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xenia-canary.png"
  install -Dm644 512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/xenia-canary.png"
  install -Dm644 1024.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/xenia-canary.png"
  install -Dm644 xenia-canary-bin.desktop "${pkgdir}/usr/share/applications/xenia-canary-bin.desktop"
  install -Dm755 xenia-canary-bin "${pkgdir}/usr/bin/xenica-canary-bin"
}
