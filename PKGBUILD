pkgname=unity-version-manager
pkgver=2.4.0
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Larusso/unity-version-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6df35730ad0649ca2699b6a4f93ee601df8eac89e86bad3028d20b8720ae6dbf')

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
