# Maintainer: gitpocalypse <joepfeiffer16@gmail.com@>

pkgname=pine-actions
pkgver=1.0.4
pkgrel=1
pkgdesc="A re-implementation of some Moto Actions for the Pine Phone"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/jpfeiffer16/pine-actions"
license=('GPL')
makedepends=('gcc' 'make')
provides=()
conflicts=("${pkgname}")
install=pine-actions.install
source=("${pkgname}_${pkgver}.orig.tar.gz"::"https://github.com/jpfeiffer16/pine-actions/archive/v${pkgver}.tar.gz")
sha256sums=('b7983e008ef6a747b8817c4ec9e25cd8df1004bdd51ddb3fa418400787e76450')

build() {
  cd Pine-Actions-${pkgver}
  make
}

package() {
  cd Pine-Actions-${pkgver}
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/usr/bin
  make DESTDIR="$pkgdir" install
}
