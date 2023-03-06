# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin

_ghrepo=andydecleyre/archbuilder_${_pkgname}

pkgver=4.6.5   # match telegram-desktop-userfonts:pkgver
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
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl-1.1' 'protobuf')

# optdepends match telegram-desktop-userfonts:optdepends
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source=("https://github.com/${_ghrepo}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")

# sha512sums match latest successful build at releases URL
sha512sums=('9a0727c6c0060616c52fd1e0ca38fdd17a13e340615fe1addfdb0d7db215b7c2a863d5c4284d99cab5b0768d8738998dce6eda9484d9b59c69a7d8c335706337')

package() {
  cp -a usr $pkgdir/
}
