# Maintainer: Ash <xash at riseup d0t net>
# Contributor: baboon

pkgname="xenia-canary-bin"
_binary="xenia_canary"
# pkgver is based on the git hash of the latest release
pkgver=$( echo $(curl -s "https://api.github.com/repos/xenia-canary/xenia-canary-releases/releases/latest" | grep tag_name) | cut -b 14-20 )
pkgrel=2
pkgdesc="Xenia Canary is an experimental fork of the Xenia emulator."
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
_target="xenia_canary_linux-${pkgver}.tar.xz"
conflicts=('xenia-git' 'xenia-canary-git')
provides=('xenia')
source=("${_target}::https://github.com/xenia-canary/xenia-canary-releases/releases/download/${pkgver}/xenia_canary_linux.tar.xz"
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
            'ea38bc10399746077ff2729e40c5038308ffbae7d819f7efaae7f37852c31d9fa728bd1252d402bbe5737a1ffeb23b22ad4eb69c2e0d02c666028a49360694d7'
            '49d21fd5e3102afd4b3e388b88d626882cbb82a6ee83b1d4a9766d278386c8021a4160919034df950c31baf02386cd7ed1fc290581abbd1ab3772a41d54b255d'
            '04f5f73252ccbc481a7df7d562b3e340f8561133c3b891d34865c94fd509cd7d93e8dcbe88ea26137678684041f43fb1494d8d62c35a22663bcdef402d55f34e'
            '684de7bf08a5b3b91d8d30b8dff1eead3041e70b0cc9f379997d31362b6ad8f587107ff6d9a3d1225c527088f1fb6b954ce5868db9576e76f585b8e5416b27b7'
            '9108644d57d9b5b78e6721c43303c1202e378c6c45b6d86d4a3174b419f7f76ec9247e8817fe46796c350c8988f185d939f5758839da355dfb3595fb47f0d421'
            '2f6302ca95d6e52d46669a9f108d6d5e2fe3b4b5438b581e4ac2c9c74f39abbd936de05a760336e60407737b5ef2be70ce5504b9ba90d3e0ed5e79f9ab0d82ee'
            'b1b9dfb01ebc9f2340d1bc40a36c28f03d2175e33c33cde2b51d1d59d97705ebf4353927fb94848e590b758f139703c069ab444c401c4ce9d90544d49b4f6c3f'
            'b7fc7ab44af308ba476a223a385777b82374cb5397d3948b49f602846328990a426121ff83a723af0e855d3416e44407337e5e2fb021a1f2418aff35c1b42f5d'
            'e326908057cf0772d4a48fbdf871d04efa82e18c8c779daa6dc8b120dab0406bb36066220812923b841ac440b46a330d59ff8acb29a9dc8e20ad2e8a765eef18'
            '10f534be248b974e974116900e4aa5e3f4892fe98cbe994c584226ccd7e00191570eab6a8444856559cf293cafb4ba8c3a794c1c8a65c6610cf3d5e5ee75f010')
options=('!strip')
install='xenia-canary-bin.install'

prepare() {
    tar xvf "${_target}"
}

package() {
  install -Dm755 build/bin/Linux/Release/xenia_canary "${pkgdir}/usr/bin/xenia_canary"
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
  install -Dm755 xenia-canary-bin "${pkgdir}/usr/bin/xenia-canary-bin"
}
