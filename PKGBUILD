# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

_pkgname=telegram-desktop-userfonts
pkgname=${_pkgname}-bin

_ghrepo=andydecleyre/archbuilder_${_pkgname}

pkgver=3.2.5   # match telegram-desktop-userfonts:pkgver
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
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'libtg_owt')

# optdepends match telegram-desktop-userfonts:optdepends
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

source=("https://github.com/${_ghrepo}/releases/download/${pkgver}-${_pkgrel}/${_pkgname}-${pkgver}-${_pkgrel}-${arch}.pkg.tar.zst")

# sha512sums match latest successful build at releases URL
sha512sums=('162a77e34adf53e2ea95dbcb40a2ca40a15f88de21d48159009e2cd31e198487389ba8dc7398d2f8d092c4cd48215b65e77dafacb0e7f84bcf40d1a2cfe61eae')

package() {
  cp -a usr $pkgdir/
}
