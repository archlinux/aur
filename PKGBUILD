# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin

_ghrepo=andydecleyre/archbuilder_${_pkgname}

pkgver=4.14.9  # match telegram-desktop-userfonts:pkgver
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
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'glibmm-2.68')

# optdepends match telegram-desktop-userfonts:optdepends
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source=("https://github.com/${_ghrepo}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")

# sha512sums match latest successful build at releases URL
sha512sums=('bf87e2e9a7776fd4418565b1570dbb1d4c3d5073dbda87031fc8f1bc4701b326ecddc89d161c642074fe439321e6495f1bec804fc2d92d6acba92e4209b07c64')

package() {
  cp -a usr $pkgdir/
}
