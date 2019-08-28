pkgname=emulator-8080-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Intel 8080 Emulator"
arch=('x86_64')
url="https://gitlab.com/azizyus/emulator-8080"
license=('MIT')
makedepends=('git')
depends=('glut' 'glu')
source=('git+https://gitlab.com/azizyus/emulator-8080.git')
md5sums=('SKIP')

pkgver() {
  cd emulator-8080
  git describe --long --tags  | cut -d- -f1
}

prepare() {
	
mkdir -p build

}

build() {

cd build
cmake ../emulator-8080
make


}

package() {


make -C build DESTDIR="${pkgdir}/usr" install

}

