# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: megadriver <megadriver at gmx dot com>

_theme=lxdm-theme
pkgname=archlinux-${_theme}
pkgver=1
pkgrel=3
pkgdesc="Simple Arch Linux theme for LXDM, by Thayer Williams and Allan McRae"
arch=('any')
url="http://allanmcrae.com/2011/08/simple-arch-linux-theme-for-lxdm/"
license=('CCPL:by-sa')
depends=('lxdm')
source=("http://allanmcrae.com/files/${_theme}.tar.gz"
        "git-fixes.patch")
sha256sums=('1eeaee69da8dd0ab28fc6967b06d4594980808bed83e822858a31b46926acbe7'
            '95f3e1b63f38fb6289beed290c15c022836a2800e4358e22e6c7ec52c741af30')

prepare() {
  patch -Np0 -i git-fixes.patch
}

package() {
  install -d "$pkgdir/usr/share/lxdm/themes/Archlinux"
  cp -dpr --no-preserve=ownership AUTHORS README TRADEMARKS gtkrc *.png greeter.ui "$pkgdir/usr/share/lxdm/themes/Archlinux"
}

# vim:set ts=2 sw=2 et:
