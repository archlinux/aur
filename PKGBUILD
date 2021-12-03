pkgname=unity-version-manager
pkgver=2.6.0
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Larusso/unity-version-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c88a14c804bfb8213cea930e6c440e6844023584699ffd4432ddd2c3c73ef52')

build() {
  cd $pkgname-$pkgver
  cargo build --release --all
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
