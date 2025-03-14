# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=kpeoplevcard
pkgver=0.1
pkgrel=1
pkgdesc='Expose VCard contacts to KPeople'
arch=(x86_64)
url='https://kde.org'
license=('LGPL-2.1-or-later')
depends=('kpeople5' 'kcontacts5')
makedepends=(extra-cmake-modules)
provides=("${pkgname}")
source=("https://download.kde.org/Attic/kpeoplevcard/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('7eb750d8729a2f681b1343467d8673d4')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}-${pkgver}"
	cmake --build build --config Release
}

package() {
	DESTDIR="${pkgdir}" cmake --install build --config Release
}
