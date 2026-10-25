# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=typepper-bin
_pkgname=typepper
pkgver=0.5.0
pkgrel=1
pkgdesc='A spicy little typing game for your terminal and browser (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://typepper.com/'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
_rel="https://github.com/leodiegues/typepper/releases/download/v$pkgver"
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.xz::$_rel/typepper-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.xz::$_rel/typepper-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('788e6372e48cb684f61b3919bb69a852a0d24fa1bce82dc14363344dc8b76f9e')
sha256sums_aarch64=('886f6a4fc5ad673603a7311df9c56bc53f289c4b257833b7287f5d793bc336b1')

package() {
  cd "$srcdir/typepper-$CARCH-unknown-linux-gnu"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$_pkgname/CHANGELOG.md"
}
