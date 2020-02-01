# Maintainer: Emanuel Serpa <emanuelserpa@alu.ufc.br>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TingPing <tingping@tingping.se>
pkgname=hexchat-python2
pkgver=2.14.3
pkgrel=1
pkgdesc='A popular and easy to use graphical IRC (chat) client, with python2 support.'
arch=('x86_64')
url='https://hexchat.github.io/'
license=('GPL')
conflicts=('hexchat' 'hexchat-git' 'hexchat-lua-git')
depends=('dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk2'
         'libcanberra' 'libnotify' 'libproxy' 'openssl' 'pango' 'pciutils')
makedepends=('git' 'intltool' 'iso-codes' 'lua' 'meson' 'perl' 'python2')
optdepends=('enchant: Spell check'
            'iso-codes: Display language names instead of codes'
            'lua: Lua plugin'
            'perl: Perl plugin'
            'python2: Python plugin')
source=("git+https://github.com/hexchat/hexchat.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson hexchat build \
    -Dwith-lua='lua' \
    -Dwith-text='true' \
    -Dwith-python='python2'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et
