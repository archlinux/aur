# Maintainer Haskellfant <moritz.kiefer@purelyfunctional.org
pkgname=zam-plugins-git
pkgver=3.4.r0.gc0b5904
pkgrel=2
pkgdesc="Collection of LV2/LADSPA/VST audio plugins for high quality processing"
arch=('i686' 'x86_64')
url="https://github.com/zamaudio/zam-plugins"
license=('GPL2')
provides=('zamplugins')
depends=('gcc-libs')
makedepends=('git' 'pkg-config' 'libx11' 'libgl' 'liblo' 'jack' 'ladspa')
optdepends=()
source=("$pkgname"::'git://github.com/zamaudio/zam-plugins.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
