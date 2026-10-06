# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=sonic-ecco
pkgver=26.08.0
pkgrel=1
pkgdesc='SonicDE File Manager'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-ecco'
license=(LGPL-2.0-or-later)
depends=(baloo
         baloo-widgets
         glibc
         kbookmarks
         kcmutils
         kcodecs
         kcompletion
         kconfig
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kjobwidgets
         knewstuff
         knotifications
         kparts
         kservice
         ktextwidgets
         kuserfeedback
         kwidgetsaddons
         kxmlgui
         libstdc++
         qt6-base
         qt6-multimedia
         solid
         sonic-frameworks-color-scheme
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-icon-themes
         sonic-frameworks-io
         sonic-frameworks-io-extras
         sonic-frameworks-settings-ui
         sonic-frameworks-windowsystem)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('dolphin-plugins: extra plugins'
            'ffmpegthumbs: video thumbnails'
            'filelight: detailed disk usage statistics'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'kdenetwork-filesharing: samba usershare properties menu'
            'kdf: view disk usage'
            'kio-admin: for managing files as administrator'
            'kompare: comparing files menu action'
            'purpose: share context menu'
            'sonic-terminal-tools: for editing file type options'
            'sonic-terminal: terminal panel')
provides=(dolphin)
conflicts=(dolphin)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('38f18867d455f7461c87e6eb5715c078ae3ead96f243260f742477216be9b771')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
