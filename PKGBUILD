# $Id$
# Maintainer: Aoibhinn Nic Aoidh <oibindnicaoidh@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

pkgname=luakit
pkgver=2017.08.10
pkgrel=2
pkgdesc='Browser framework based on Webkit and Lua'
arch=('x86_64')
url='https://luakit.github.io/'
license=('GPL3')
depends=('webkit2gtk' 'lua51-filesystem' 'luajit')
makedepends=('help2man')
backup=('etc/xdg/luakit/globals.lua'
        'etc/xdg/luakit/rc.lua'
        'etc/xdg/luakit/theme.lua'
        'etc/xdg/luakit/webview.lua'
        'etc/xdg/luakit/webview_wm.lua'
        'etc/xdg/luakit/window.lua')
source=("$pkgname-$pkgver.tar.gz::https://github.com/luakit/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('23d98b6b51b66c85b6823cd287e161e1093b80639f06f1da9b0a7290b0859d37')

build() {
  cd $pkgname-$pkgver
  make USE_LUAJIT=1 DEVELOPMENT_PATHS=0 PREFIX=/usr all
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
