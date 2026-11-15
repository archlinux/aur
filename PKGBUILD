# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=darwan-bin
_pkgname=darwan
pkgver=0.6.2
pkgrel=1
pkgdesc='Themes for the SDDM login screen and the Quickshell lockscreen, with a CLI, TUI and GUI (prebuilt)'
arch=('x86_64')
url='https://github.com/mah3uz/darwan'
license=('GPL-3.0-only' 'LGPL-2.1-only OR LGPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'mpv'
  'polkit'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-multimedia'
  'qt6-multimedia-ffmpeg'
  'quickshell'
  'ttf-jetbrains-mono-nerd'
)
optdepends=(
  'sddm: use the themes on the login screen'
  'libfaketime: darwan preview --at'
  'noto-fonts-cjk: Chinese text in the Genshin theme'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.pkg.tar.zst")
sha256sums=('c0e691195359d6bc166f1069a1a1945ab8bf5f8e8ce9564e41db979c9a1bfcb0')

package() {
  cp -r --no-preserve=ownership "$srcdir/usr" "$pkgdir/"
}
