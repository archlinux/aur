# Maintainer: Mahfuz Shaikh <mah3uz at gmail dot com>

pkgname=darwan-bin
_pkgname=darwan
pkgver=0.3.0
pkgrel=1
pkgdesc='Themes for the SDDM login screen and the Quickshell lockscreen, with a CLI, TUI and GUI (prebuilt)'
arch=('x86_64')
url='https://github.com/mah3uz/darwan'
license=('GPL-3.0-only')
depends=(
  'gcc-libs'
  'glibc'
  'mpvqt'
  'polkit'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
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
sha256sums=('b3823b8ad6c15904746f4959835567d096889fe77c67d059dce25152855ee71e')

package() {
  cp -r --no-preserve=ownership "$srcdir/usr" "$pkgdir/"
}
