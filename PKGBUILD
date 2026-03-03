# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>

_pkgname=wayvr
pkgname="$_pkgname-bin"
pkgver=26.2.1
pkgrel=2
pkgdesc="OpenXR desktop overlay for Wayland compositors (binary release)"
arch=('x86_64')
url="https://github.com/wlx-team/$_pkgname"
license=('GPL')
options=('!debug')

provides=(
  "$_pkgname"
)

conflicts=(
  "$_pkgname"
)

depends=(
  'glibc'
  'gcc-libs'
  'libx11'
  'libxrandr'
  'libxinerama'
  'libxkbcommon'
  'wayland'
  'libdrm'
  'vulkan-icd-loader'
  'fontconfig'
  'freetype2'
  'dbus'
  'libpipewire'
  'alsa-lib'
  'openvr'
  'openxr'
)

source=(
    "https://github.com/wlx-team/$_pkgname/releases/download/v$pkgver/wayvr"
    "https://github.com/wlx-team/$_pkgname/releases/download/v$pkgver/wayvrctl"
    "https://raw.githubusercontent.com/wlx-team/$_pkgname/refs/tags/v$pkgver/$_pkgname/wayvr.desktop"
    "https://raw.githubusercontent.com/wlx-team/$_pkgname/refs/tags/v$pkgver/$_pkgname/wayvr.png"
    "https://raw.githubusercontent.com/wlx-team/$_pkgname/refs/tags/v$pkgver/$_pkgname/wayvr.svg"
)

sha256sums=('f111e63641eecca5d04967843eab12cfa98adeb48f8709cd901c54373f37d925'
            '093257af53f0c70d5fff0a1367a750415bee0e2056a81bc932604fd641e6c290'
            '7f94eac929a5139aef7b7a155c05d09626b07afdb5d9616c5aad6890b7e41297'
            '0deb4c457aaa310665ea19567875173103fc29b634a2b6169571e3a88be41399'
            'a2fb31022b6605d10dcb062f83bc3d1e71b221ed588e67c49cfb1b8e2a0db2e8')

package() {
  cd "$srcdir"

  # main binary
  install -Dm0755 $_pkgname \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm0755 ${_pkgname}ctl \
    "$pkgdir/usr/bin/${_pkgname}ctl"

  # .desktop file
  install -Dm0644 $_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  install -Dm0644 "$_pkgname.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm0644 "$_pkgname.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
