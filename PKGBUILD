# Maintainer: Drew33 public@rembrandt.dev

pkgname=xdg-desktop-portal-kde-git
_pkgname=xdg-desktop-portal-kde
pkgver=20190109.011ae60
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal that is using Qt/KDE.'
url='https://github.com/KDE/xdg-desktop-portal-kde'
license=('GPL')
arch=('x86_64')
makedepends=('cmake' 'extra-cmake-modules' 'plasma-wayland-protocols')
depends=('xdg-desktop-portal')
source=('git://github.com/KDE/xdg-desktop-portal-kde.git')
sha1sums=('SKIP')
conflicts=('xdg-desktop-portal-kde')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-kde')
install=install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}"

}

build() {
 mkdir xdg-desktop-portal-kde/build && cd xdg-desktop-portal-kde/build
 cd xdg-desktop-portal-kde/build & cmake --prefix=/usr --libexec=/usr/lib  .. 
 make
}

package() {
    cd xdg-desktop-portal-kde/build
	make DESTDIR="$pkgdir/" install
}
 
