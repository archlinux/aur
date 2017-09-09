# Maintainer: Emanuel Serpa <emanuelserpa@alu.ufc.br>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: TingPing <tingping@tingping.se>

pkgname=hexchat-python2
pkgver=2.12.4
pkgrel=1
pkgdesc='A popular and easy to use graphical IRC (chat) client, with python2 support'
arch=('i686' 'x86_64')
url='https://hexchat.github.io/'
license=('GPL')
provides=('hexchat')
conflicts=('hexchat' 'hexchat-git' 'hexchat-lua-git')
depends=('dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'libcanberra' 'libnotify' 'libproxy' 'openssl' 'pango' 'pciutils')
makedepends=('intltool' 'iso-codes' 'lua' 'perl' 'python2' 'autoconf-archive')
optdepends=('enchant: Spell check'
            'iso-codes: Display language names instead of codes'
            'lua: Lua plugin'
            'perl: Perl plugin'
            'python: Python plugin')
source=("https://dl.hexchat.net/hexchat/hexchat-${pkgver}.tar.xz")
sha256sums=('fa35913158bbc7d0d99de79371b6df3e8d21802f1d2c7c92f0e5db694acf2c3a')


build() {
  cd hexchat-${pkgver}

  ./configure \
    --prefix='/usr' \
    --enable-python='python2' \
    --enable-textfe
  make
}

package() {
  cd hexchat-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
