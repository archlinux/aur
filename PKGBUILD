pkgname=unity-version-manager
pkgver=2.4.1
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Larusso/unity-version-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86e3e06375ceb977673c6348358b971d3208e7e88513d9ab5ca6ad7cdfb0d0a6')

build() {
  cd $pkgname-$pkgver
  cargo build --release --all
}

package() {
  cd $pkgname-$pkgver
  cargo install --path ./commands/uvm --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-commands --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-detect --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-download-manifest --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-fix-modules-json --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-generate-modules-json --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-help --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-launch --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-list --root "$pkgdir"/usr
  cargo install --path ./install/uvm-install --root "$pkgdir"/usr
  cargo install --path ./install/uvm-modules --root "$pkgdir"/usr
  cargo install --path ./install/uvm-install2 --root "$pkgdir"/usr
  cargo install --path ./install/uvm-uninstall --root "$pkgdir"/usr
  cargo install --path ./install/uvm-versions --root "$pkgdir"/usr
}
