# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>
pkgname=kcm-wacomtablet
pkgver=2.9.82
pkgrel=2
epoch=1
pkgdesc="KDE GUI for the Wacom Linux Drivers"
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/1127862/"
license=('GPL')
depends=('plasma-framework' 'xf86-input-wacom')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdoctools')
source=("wacomtablet-$pkgver::git://anongit.kde.org/wacomtablet.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/wacomtablet-$pkgver"
}

build() {
  cd "$srcdir/wacomtablet-$pkgver"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/wacomtablet-$pkgver"

  make DESTDIR="$pkgdir" install
}

