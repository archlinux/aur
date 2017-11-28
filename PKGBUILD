# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=asublim
pkgver=0.1
pkgrel=2
pkgdesc='Clone of the xsublim screensaver'
arch=('x86_64')
depends=('xorg-rgb' 'xorg-xlsfonts' 'xosd' 'zsh')
makedepends=('git')
source=("git+https://github.com/enkiv2/asublim#commit=b642015ac9ecc874b0f89f6c2c4b3a3fc5562781")
md5sums=('SKIP')

prepare() {
  sed -i "s,/usr,$pkgdir/usr,g" "$pkgname/Makefile"
  sed -i 's,/etc/X11,/usr/share/X11,g' "$pkgname/sublimWrap"
}

build() {
  make -C "$pkgname"
}

package() {
  install -Dm755 "$pkgname/sublim" "$pkgdir/usr/bin/asublim"
  install -Dm755 "$pkgname/sublimWrap" "$pkgdir/usr/bin/sublimWrap"
}

# vim: ts=2 sw=2 et:
