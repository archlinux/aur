pkgname=unity-version-manager
pkgver=2.6.1
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Larusso/unity-version-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b6a63d5ab40ec9d3f2245a9cb4487480e741a9b5f6a71e64192c93ce4c742a6')

build() {
  cd $pkgname-$pkgver
  cargo build --release --all
}

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
