# Maintainer: envolution
# Contributor: l-koehler <lorenz.koehler@posteo.de>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=dolphin-git
_pkgname=dolphin
pkgver=24.12.0+r8308+g8d155558e
pkgrel=1
pkgdesc='KDE File Manager (git)'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL-2.0-or-later)
provides=(dolphin=$pkgver)
conflicts=(dolphin)
depends=(baloo
  baloo-widgets
  gcc-libs
  glibc
  kbookmarks
  kcmutils
  kcodecs
  kcolorscheme
  kcompletion
  kconfig
  kconfigwidgets
  kcoreaddons
  kcrash
  kdbusaddons
  kfilemetadata
  kguiaddons
  ki18n
  kiconthemes
  kio
  kio-extras
  kjobwidgets
  knewstuff
  knotifications
  kparts
  kservice
  ktextwidgets
  kuserfeedback
  kwidgetsaddons
  kwindowsystem
  kxmlgui
  phonon-qt6
  qt6-base
  solid)
makedepends=(extra-cmake-modules
  kdoctools
  git)
optdepends=('ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kdenetwork-filesharing: samba usershare properties menu'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
  'purpose: share context menu')
groups=(kde-applications
  kde-system)
#source=(git+https://invent.kde.org/system/dolphin.git)
source=(git+https://github.com/KDE/dolphin.git)
sha256sums=('SKIP')

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
# vim:set ts=2 sw=2 et:
