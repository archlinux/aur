pkgname=unity-version-manager
pkgver=2.5.0
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Larusso/unity-version-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('332fa2dc1a3c62f5c66011c14b6c3565b85564e07c9ebce5ae41033e61a880f9')

build() {
  cd $pkgname-$pkgver
  cargo build --release --all
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
