# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-phonebook
pkgver=24.02.0
pkgrel=2
pkgdesc="Phone book for Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma-mobile/plasma-phonebook"
license=('GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL')
depends=('ki18n' 'kcoreaddons' 'kconfig' 'kpeople' 'kcontacts' 'kpeoplevcard' 'kirigami' 'kirigami-addons')
provides=(${pkgname})
makedepends=('extra-cmake-modules' 'qt6-svg' 'qt6-tools' 'git')
source=("${pkgname}-${pkgver}::git+https://invent.kde.org/plasma-mobile/${pkgname}.git#tag=v24.02.0")
sha256sums=('726a1acf318957df77a05affa76fd3357686d361fb924dc48d692c223cd7c853')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
