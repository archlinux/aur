# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=lib3ds
pkgrel=1
pkgver=1.3.0
pkgdesc="An overall software library for managing 3D-Studio Release 3 and 4 .3DS files and a free alternative to Autodesk's 3DS File Toolkit."
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/lib3ds/"
license=('LGPL2.1 or any later version')
depends=('glibc')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/lib3ds/lib3ds-${pkgver}.zip")
md5sums=('2572f7b0f29b591d494c1a0658b35c86')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
