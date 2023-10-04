# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin

_ghrepo=andydecleyre/archbuilder_${_pkgname}

pkgver=4.10.3  # match telegram-desktop-userfonts:pkgver
_pkgrel=1      # match telegram-desktop-userfonts:pkgrel

pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')

# depends match telegram-desktop-userfonts:depends
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'glibmm-2.68')

# optdepends match telegram-desktop-userfonts:optdepends
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source=("https://github.com/${_ghrepo}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")

# sha512sums match latest successful build at releases URL
sha512sums=('b01d9c61a70135a601c007beba93a7ab6f46f92792f4acc8df57c6e9c9f3e21b5cee3798ef97b8affac1ac7dc028a4150af11040a15c9b8aee8e5071f19b9e6b')

package() {
  cp -a usr $pkgdir/
}
