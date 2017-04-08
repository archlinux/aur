# Maintainer: Veaceslav Munteanu <veaceslav.munteanu90@gmail.com>
# Maintainer: Mateusz Piekos <mateuszpiekos@gmail.com>
pkgname=qpass-qt5
pkgver=2.0.0
pkgrel=1
pkgdesc="Easy to use password manager with built-in password generator, qt5 version"
arch=('i686' 'x86_64')
url="http://qpass.sourceforge.net"
depends=('qt5-base>=5.3' 'qt5-tools>=5.3' 'libgcrypt')
makedepends=('cmake')
license=('GPL3')
source=(qpass-qt5::git+https://github.com/veaceslav/qpass-qt5.git)
md5sums=('SKIP')
conflicts=("qpass")
install=qpass.install

build() {

cd "$srcdir/$pkgname"
mkdir -p "build"
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../
make VERBOSE=1 -j 4
}

package() {
cd "$srcdir/$pkgname/build"
make DESTDIR="$pkgdir" install
}

